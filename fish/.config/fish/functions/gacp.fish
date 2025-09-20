function gacp 
    if test (count $argv) -ne 1
    echo "Error: Commit message is required."
    return 1
  end

  set msg $argv[1]
  
  git add .
  git commit -m "$msg"
  git push
end 


