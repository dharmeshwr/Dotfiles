function restart 
    if test (count $argv) -ne 1
        echo "Error: process name required"
        return 1
    end

    set process $argv[1]

    # Kill all processes by name (using pkill)
    pkill $process

    # Start it again using setsid
    setsid $process &
end
