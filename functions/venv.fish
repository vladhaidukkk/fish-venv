function venv --argument-names cmd arg --description "Activate/Deactivate virtual environment faster"
    set venv_version 1.3.0

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
            if string length -q $AUTO_VENV
                set auto_venv_status enabled
            else
                set auto_venv_status disabled
            end

            if string length -q $AUTO_VENV_HIDE_DETAILS
                set auto_venv_hide_details_status enabled
            else
                set auto_venv_hide_details_status disabled
            end

            echo "Extras:"
            echo "       auto-venv               Automatically activate virtual environment on directory change  ($auto_venv_status)"
            echo "       auto-venv-hide-details  Hide details of automatic virtual environment activation  ($auto_venv_hide_details_status)"
            echo "Help:"
            echo "       venv enable <extra>   Enable extra"
            echo "       venv disable <extra>  Disable extra"
        case enable
            switch $arg
                case auto-venv
                    set -U AUTO_VENV enabled
                case auto-venv-hide-details
                    set -U AUTO_VENV_HIDE_DETAILS enabled
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
                case auto-venv-hide-details
                    set -e AUTO_VENV_HIDE_DETAILS
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
            echo "       venv extras   List available extras"
            echo "       venv enable   Enable extra"
            echo "       venv disable  Disable extra"
            echo "Options:"
            echo "       -v, --version  Print version"
            echo "       -h, --help     Print this help message"
    end
end
