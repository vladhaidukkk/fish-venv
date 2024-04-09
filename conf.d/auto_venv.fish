function __auto_venv --on-variable PWD --description "Automatically activate virtual environment on directory change"
    if status --is-command-substitution
        return
    end

    if not string length -q $AUTO_VENV
        return
    end

    set venv_dir (__venv_dir)

    if test -e $venv_dir/bin/activate.fish
        if test "$VIRTUAL_ENV" != "$venv_dir"; or not string match -q "$venv_dir/bin" $PATH
            source $venv_dir/bin/activate.fish
            if not string length -q $AUTO_VENV_HIDE_DETAILS
                echo "activated $venv_dir"
            end
        end
    end
end

__auto_venv
