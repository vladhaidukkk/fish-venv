function venv --argument-names cmd arg --description "Activate/Deactivate virtual environment faster"
    set venv_version 1.2.0

    switch $cmd
        case -v --version
            echo "fish-venv $venv_version"
        case on
            set venv_dir (__venv_dir)

            if test -e $venv_dir/bin/activate.fish
                if test "$VIRTUAL_ENV" != "$venv_dir"; or not string match -q "$venv_dir/bin" $PATH
                    source $venv_dir/bin/activate.fish
                    echo "activated $venv_dir"
                else
                    echo "$venv_dir already activated"
                end
            end
        case off
            if test -n "$VIRTUAL_ENV"
                set venv_dir $VIRTUAL_ENV
                deactivate
                echo "deactivated $venv_dir"
            end
        case extras
            if set -q AUTO_VENV
                set auth_venv_status enabled
            else
                set auth_venv_status disabled
            end

            echo "Extras:"
            echo "       auto-venv  Automatically activate virtual environment on directory change  ($auth_venv_status)"
            echo "Help:"
            echo "       venv enable <extra>   Enable extra"
            echo "       venv disable <extra>  Disable extra"
        case enable
            switch $arg
                case auto-venv
                    set -U AUTO_VENV enabled
                case "*"
                    echo "Usage:"
                    echo "       venv enable <extra>  Enable extra from available extras"
                    echo "Options:"
                    echo "       -h, --help  Print this help message"
            end
        case disable
            switch $arg
                case auto-venv
                    set -e AUTO_VENV
                case "*"
                    echo "Usage:"
                    echo "       venv disable <extra>  Disable extra from available extras"
                    echo "Options:"
                    echo "       -h, --help  Print this help message"
            end
        case "*"
            echo "Usage:"
            echo "       venv on       Activate virtual environment"
            echo "       venv off      Deactivate virtual environment"
            echo "       venv options  List available extras"
            echo "       venv enable   Enable extra"
            echo "       venv disable  Disable extra"
            echo "Options:"
            echo "       -v, --version  Print version"
            echo "       -h, --help     Print this help message"
    end
end
