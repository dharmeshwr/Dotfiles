function dev
    # 1. Get current folder name for the session
    set session_name (basename $PWD)

    # 2. Check if session exists (silencing error output)
    if tmux has-session -t $session_name 2>/dev/null
        # If exists, attach
        tmux attach-session -t $session_name
    else
        # 3. Create new detached session, naming the first window 'editor'
        tmux new-session -d -s $session_name -n 'nvim'

        tmux send-keys -t $session_name:nvim 'nvim' C-m

        # 5. Create second window named 'server'
        tmux new-window -t $session_name -n 'server'

        # 6. Run pnpm dev in the second window
        tmux send-keys -t $session_name:server 'pnpm dev' C-m

        # 7. Focus back on the editor window
        tmux select-window -t $session_name:nvim

        # 8. Attach
        tmux attach-session -t $session_name
    end
end
