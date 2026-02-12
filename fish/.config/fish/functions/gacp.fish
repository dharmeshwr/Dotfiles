function gacp
    if test (count $argv) -ne 1
        echo "Error: Commit message is required."
        return 1
    end
    set msg $argv[1]

    git add --all

    if git diff --cached --quiet; then
        echo "No changes to commit."
        return 1
    end

    echo "==== Staged Files ===="
    set staged (git diff --name-only --cached)
    if test (count $staged) -eq 0
        echo "(none)"
    else
        for file in $staged
            echo $file
        end
    end

    git commit -m "$msg" && git push
end
