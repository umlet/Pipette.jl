# Pipette: A Smoother Pipe Operator

If you love the Julia REPL and the pipe operator,

if you have a problem with typing `[Space][AltGr or Shift+"|"][Shift+">"][Space]`,

and if no one else can help,

maybe **you** can hire Pipette and double-tap arrow-right [➔] at the end of the line:

```julia
julia> gettransmogrifyingiterator()#..double tap [➔]..
```
Voilà:
```julia
julia> gettransmogrifyingiterator() |> #..ta ta-da TAAAA!
```

<br>

Alternatively, or when you are in the middle of the line, press `[Ctrl+➔]` to insert the string `" |> "`.

<br>
<br>



### Usage

- The double-tap must be "faster" than 300 milli-seconds. It also must be "slower" than 100 milli-seconds -- this avoids pipes galore when you keep pressing the cursor to reach the end of a line.

  You can configure this with
  ```julia
  julia> Pipette.set_doubletap_delay(from=100, to=300)
  ```

- To tune this range, use `Pipette.tune_doubletap_delay()`.

- To turn this on or off, use `Pipette.on()` or `Pipette.off()`.

<br>
<br>



### Install

Just `]add Pipette`, and keep `using Pipette`.

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





<!-- alt repr of cursor:
[🡲] -->

