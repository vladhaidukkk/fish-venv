# fish-venv

`fish-venv` is a handy Fish Shell plugin designed to simplify the activation and deactivation of Python virtual environments. If you often work with Python projects and need to switch virtual environments frequently, this plugin will help you make this process faster and more efficient.

## Installation

Install the `fish-venv` plugin using your preferred Fish Shell plugin manager. For example, using [Fisher](https://github.com/jorgebucaran/fisher):

```shell
fisher install vladhaidukkk/fish-venv
```

Alternatively, you can do it manually by copying `functions/venv.fish` into `.config/fish/functions`.

## Usage

**Activate Virtual Environment (searches in git repository and current working directory):**

```shell
venv on
```

**Deactivate Virtual Environment:**

```shell
venv off
```

That's it! Enjoy a more efficient workflow when dealing with Python virtual environments using the `fish-venv` plugin. Happy coding! 🐟🐍

## Resources

Automatically activate and deactivate virtual environments in Fish Shell with [auth-venv](https://github.com/nakulj/auto-venv).

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/vladhaidukkk/fish-venv).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
