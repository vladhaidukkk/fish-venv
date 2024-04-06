# fish-venv

`fish-venv` is a handy Fish Shell plugin designed to simplify the activation and deactivation of Python virtual environments. If you often work with Python projects and need to switch virtual environments frequently, this plugin will help you make this process faster and more efficient.

## Installation

Install the `fish-venv` plugin using your preferred Fish Shell plugin manager. For example, using [Fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install vladhaidukkk/fish-venv
```

Alternatively, you can do it manually by copying the files from `functions` and `conf.d` to `.config/fish/functions` and `.config/fish/conf.d`.

## Usage

**Activate Virtual Environment (searches in git repository and current working directory):**

```shell
venv on
```

**Deactivate Virtual Environment:**

```shell
venv off
```

**List Available Extras:**

```shell
venv extras
```

**Enable Extra:**

```shell
venv enable <extra>
```

**Disable Extra:**

```shell
venv disable <extra>
```

That's it! Enjoy a more efficient workflow when dealing with Python virtual environments using the `fish-venv` plugin. Happy coding! 🐟🐍

## Extras

The `fish-venv` plugin offers additional, optional functionalities aimed at further simplifying and enhancing your development workflow. These "extras" are designed to be modular and can be enabled or disabled as per your preferences.

### Available Extras

- **auto-venv:** Automatically activates the relevant Python virtual environment when you enter a directory. This extra eliminates the need to manually activate virtual environments as you navigate between your projects.

    **Enable auto-venv:**

    ```shell
    venv enable auto-venv
    ```

    **Disable auto-venv:**

    ```shell
    venv disable auto-venv
    ```

    The inspiration for "auto-venv" extra came from the [auto-venv](https://github.com/nakulj/auto-venv) Fish Shell plugin.

## Integrations

### Pyenv

Typically, you'd enable `pyenv` in `config.fish` according to the [official documentation](https://github.com/pyenv/pyenv?tab=readme-ov-file#getting-pyenv). This placement unfortunately conflicts with the `auto-venv` extra as it is placed in the `conf.d` folder. In Fish v3.0+, scripts from `conf.d` are executed before `config.fish`. As a result, `pyenv` will be added to `PATH` later, and will take precedence over the local virtual environment activated by `auto-venv`. A workaround is to create a `conf.d` script, such as `__login.fish`, to run `pyenv` activation before other scripts. This doesn't make `config.fish` redundant, but rather convenient for running commands after everything else. Typically, you want the initial commands for the login shell in `__login.fish`, and the later commands for the interactive shell in `config.fish`:

**__login.fish:**

```shell
if status is-login
    set -x PYENV_ROOT $XDG_CONFIG_HOME/pyenv
    set -x PATH $PYENV_ROOT/bin $PATH
    pyenv init - | source
end
```

**config.fish:**

```shell
if status is-interactive
    starship init fish | source
end
```

Click [here](https://github.com/vladhaidukkk/dotfiles/tree/main/.config/fish) for a larger example using this approach.

### Visual Studio Code

The way Visual Studio Code activates the local virtual environment conflicts with `pyenv` because its activation process happens earlier, even if you use the `__login.fish` approach described above. We recommend you to disable this VSCode activation and rely entirely on the `auto-venv` extra.

To disable VSCode activation, add this to your settings:

```json
{
    "python.terminal.activateEnvironment": false
}
```

### PyCharm

Fortunately, PyCharm is smart enough to prevent conflicts between `pyenv` and activation of the local virtual environment, so it takes precedence over `pyenv`. But, the way it works in combination with `auto-venv` is weird. It may cause not critical but undesired conflicts. So, we recommend you to disable `auto-venv` extra for PyCharm, or if you want to use `auto-venv` and prevent conflicts, disable PyCharm's virtualenv activation.

To disable `auto-venv` extra for PyCharm, you can set the `AUTO_VENV` variable to an empty string. Go to Tools > Terminal > Project Settings > Environment variables and enter `AUTO_VENV=` there.

To disable PyCharm's virtualenv activation, got to Tools > Terminal > Application Settings and disable Activate virtualenv option.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/vladhaidukkk/fish-venv).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
