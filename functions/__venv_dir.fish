function __venv_dir
    # Check if we are inside a git repository
    if git rev-parse --show-toplevel &>/dev/null
        set dir (realpath (git rev-parse --show-toplevel))
    else
        set dir (pwd)
    end

    # Find a virtual environment in the directory
    set VENV_DIRS .env .venv env venv
    for venv_dir in $dir/$VENV_DIRS
        if test -e $venv_dir/bin/activate.fish
            break
        end
    end

    echo $venv_dir
end
