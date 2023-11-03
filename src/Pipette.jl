

module Pipette


import REPL
import REPL.LineEdit


# todo reverse min max
Base.@kwdef mutable struct _Conf
    doubletap_from_ms::Int64 = 100     # <- should be larger than the keyboard repeat delay, which often is 30 ms
    doubletap_to_ms::Int64 = 300       # <- should be larger than the human douple-tap delay, which often is around 130 ms
    on::Bool = true
end
const _CONF = _Conf()

_tokwargs(; kwargs...) = kwargs
function set_doubletap_delay(; from::Union{Int64, Nothing}=nothing, to::Union{Int64, Nothing}=nothing)
    from = from === nothing  ?  _CONF.doubletap_from_ms  :  from
    to   = to   === nothing  ?  _CONF.doubletap_to_ms    :  to
    _CONF.doubletap_from_ms, _CONF.doubletap_to_ms = from, to
    return (;from, to)
end
on() = ( _CONF.on = true; nothing )
off() = ( _CONF.on = false; nothing )


mutable struct _State  t_last_ms::Int64  end
const _STATE = _State(0)




time_ms()::Int64 = Int64(div(time_ns(), UInt64(1_000_000)))
function attemptpiper()::Bool
    !_CONF.on  &&  return false

    t0 = _STATE.t_last_ms
    t1 = time_ms()
    t1 < t0  &&  return false  # can happen every 5.8 years ha ha

    if _CONF.doubletap_from_ms < (t1 - t0) < _CONF.doubletap_to_ms
        # set last occurrence to never, to avoid retrigger at next press
        _STATE.t_last_ms = 0
        return true
    end
    _STATE.t_last_ms = t1
    return false
end




function ontap_arrowright(s,o...)  # trying to keep return behavior in line-ish..
    b = LineEdit.edit_move_right(s)
    if b === false  # attention: b is not necessarily a bool; use '==='
        # move did not occur => we are at end of line
        attemptpiper()  &&  LineEdit.edit_insert(s, " |> ")
    end
    return b
end 




const ___DEBUG = false

function _init(repl = Base.active_repl)
    ___DEBUG  &&  @info "pipette: INSERTING KEYBINDINGS!"

    main_mode = repl.interface.modes[1]

    NEW_KEYBINDINGS = Dict{Any, Any}()

    # just to test; comment out
    # NEW_KEYBINDINGS["^p"] = (s,o...) -> LineEdit.edit_insert(s, " |> ")

    # arrow right
    NEW_KEYBINDINGS["\e[C"] = ontap_arrowright

    # ctrl + arrow right
    NEW_KEYBINDINGS["\e[1;5C"] = (s,o...) -> ( _CONF.on  &&  LineEdit.edit_insert(s, " |> ") )

    main_mode.keymap_dict = LineEdit.keymap(Dict{Any, Any}[NEW_KEYBINDINGS, main_mode.keymap_dict])
end




include("tune.jl")

include("Pipette.jl_init")
end  # module

