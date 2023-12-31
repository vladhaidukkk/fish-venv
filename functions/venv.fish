function venv --argument-names cmd --description "Activate/Deactivate virtual environment faster"
    set venv_version 1.0.0

    switch $cmd
        case -v --version
            echo "fish-venv $venv_version"
        case "" -h --help
            echo "Usage:"
            echo "       venv on   Activate virtual environment"
            echo "       venv off  Deactivate virtual environment"
            echo "Options:"
            echo "       -v, --version  Print version"
            echo "       -h, --help     Print this help message"
        case on
            # Check if we are inside a git repository
            if git rev-parse --show-toplevel &>/dev/null
                set dir (realpath (git rev-parse --show-toplevel))
            else
                set dir (pwd)
            end

            # Find a virtual environment in the directory
            set VENV_DIRS env .env venv .venv
            for venv_dir in $dir/$VENV_DIRS
                if test -e $venv_dir/bin/activate.fish
                    break
                end
            end

            if test "$VIRTUAL_ENV" != "$venv_dir" -a -e $venv_dir/bin/activate.fish
                source $venv_dir/bin/activate.fish
                echo "activated $venv_dir"
            end
        case off
            if test -n "$VIRTUAL_ENV"
                set venv_dir $VIRTUAL_ENV
                deactivate
                echo "deactivated $venv_dir"
            end
    end
end
