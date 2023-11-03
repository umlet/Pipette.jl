

function tune_doubletap_delay()
    println("Press and hold <Return> for 2 seconds to see your keyboard repeat delay.")
    println("-- OR --")
    println("Tap <Return> many times quickly to see your own double-tap delay.")
    println()
    # println("Then configure PipeyPiper via settimeout(max, min):")
    # println("- max should be larger than YOU, so you can trigger pipe insert.")
    # println("- min should be larger than SYS, so holding arrow-right won't trigger pipe insert.")
    read(stdin, 1)

    T0::UInt64 = time_ms()
    t0 = T0;
    while true
        read(stdin, 1)
        t1::UInt64 = time_ms()
        dt = Int64(t1-t0)
        println("delay: $(dt) ms")
        t0 = t1

        t1 - T0 > 2000  &&  return nothing
    end
end

