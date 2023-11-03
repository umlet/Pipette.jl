

function tune_doubletap_delay()
    println("Press and hold <Return> for 2 seconds to see your keyboard repeat delay.")
    println("-- OR --")
    println("Tap <Return> many times quickly to see your own double-tap delay.")
    println()
    println("(Then use Pipette.set_doubletap_delay(from=.., to=..) such that:")
    println(" keyboard repeat delay < FROM < your double-tap delay < TO.)")
    #read(stdin, 1)
    readline()

    T0 = time_ms()
    t0 = T0;
    while true
        #read(stdin, 1)
        readline()
        t1 = time_ms()
        dt = Int64(t1-t0)
        println("delay: $(dt) ms")
        t0 = t1

        t1 - T0 > 2000  &&  return nothing
    end
end

