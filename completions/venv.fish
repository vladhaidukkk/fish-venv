complete --command venv --exclusive --long help --description "Print help"
complete --command venv --exclusive --long version --description "Print version"
complete --command venv --exclusive --condition __fish_use_subcommand --arguments on --description "Activate virtual environment"
complete --command venv --exclusive --condition __fish_use_subcommand --arguments off --description "Deactivate virtual environment"
