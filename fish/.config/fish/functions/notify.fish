function __auto_notify --on-event fish_prompt
    # Only notify for interactive shells
    if not status --is-interactive
        return
    end

    # Don't notify if command was empty
    if test -z "$CMD_DURATION"
        return
    end

    # Only notify if command took more than 10 seconds
    if test "$CMD_DURATION" -gt 10000
        set -l last_cmd (history | head -n1)

        # Avoid notifying for commands like 'ls' or 'cd'
        switch $last_cmd
            case 'cd*' 'ls*' 'clear*' 'exit*'
                return
        end

        notify-send "Completed" "$last_cmd"
    end
end

