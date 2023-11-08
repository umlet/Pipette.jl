# Pipette: A Smoother Pipe Operator

If you love the Julia REPL and the pipe operator,

if you have a problem with typing the prickly `" |> "` sequence[^1],

and if no one else can help,

maybe **you** can hire Pipette and insert `" |> "` with double-tapping arrow-right [➔] at the end of the line:

```julia
julia> get_transmogrifying_iterator()#..now just double tap [➔]..
```
Voilà:
```julia
julia> get_transmogrifying_iterator() |> #<- ta ta-da TAAAA!
```

<br>

Alternatively, press `[Ctrl+➔]` to insert the string `" |> "` anywhere on a line.

<br>
<br>



### Usage

- The delay between [➔]-taps must be <300 milli-seconds to register as double-tap.

  It also must be >100 milli-seconds -- this avoids pipes galore when you keep pressing the cursor to reach the end of a line.

  You can configure this with
  ```julia
  julia> Pipette.set_doubletap_delay(from=100, to=300)
  ```

- To tune this, find out your tapping speed and keyboard repeat delay with `Pipette.tune_doubletap_delay()`.

- To turn Pipette on or off, use `Pipette.on()` or `Pipette.off()`. To keep the `[Ctrl+➔]`-behavior, and just turn off the double-tap one, set the range to zeros.

<br>
<br>



### Install

Just `]add Pipette` and keep `using Pipette`.

To turn it on by default, you can modify `.julia/config/startup.jl`:

```julia
atreplinit() do repl
    try         @eval using Pipette  
    catch e;    @warn "Pipette startup error" e  end
end
```

(Pipette exports nothing, btw.)

<br>
<br>
<br>
<br>



---
#### Refs

- Startup logic pilfered from [OhMyREPL.jl](https://github.com/KristofferC/OhMyREPL.jl) -- thanks!

<br>
<br>



#### Version History
- 0.1 Initial version

<br>
<br>



#### Footnotes
[^1]: On a German keyboard, e.g., you need to type `[Space]` `[AltGr+"|"]` `[Shift+">"]` `[Space]`.



<!-- alt repr of cursor:
[🡲] -->

