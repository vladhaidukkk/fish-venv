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

### Current Extras:

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

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/vladhaidukkk/fish-venv).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
