# Pre-Commit Hooks

A personal collection of pre-commit hooks that can makes my life easier :)

I created a blog post *[Why You Need To Stop Using Git-Hooks](https://blog.mphomphego.co.za/blog/2019/10/03/Why-you-need-to-stop-using-Git-Hooks.html)*, if you would like to read more about pre-commit.

## Installation

On the root directory, you will find a script: `setup_hooks.sh` and the script will:

1. Find all directories under the `/home` which contain any `.git` directory
2. Install the hooks into them
3. Sets `init.templateDir` to point to `templates/git-commit-template.txt`


## Pre-commit Installation
```bash
# clone this repository and install pre-commit hooks
git clone git@github.com:mmphego/pre-commit-hooks.git
# change directory
cd pre-commit-hooks.git

# [Blind Install]
# Install pre-commit package and current hooks across all packages in your /home
./setup_hooks.sh install

# [Self-Aware install]
# Install pre-commit package
pip install pre-commit

# verify and modify `.pre-commit-config.yaml` for your python enviroment (default Python3.6)
vim .pre-commit-config.yaml

# Install pre-commit to your repository
pre-commit install
```

## Skip Checker to Commit
Skip the rule checker `pytest` with the following command:
```
SKIP=pytest pre-commit run --all-files
```

### Pre-commit contents
If you want to "skip", "ignore" or "add" the git hook rule, trying to modify pre-commit config file and take off the checker id in `.pre-commit-config.yaml` and run `pre-commit install` again.

## Usage
Use `git commit` command to run the hooks and commit staged files.
Use `pre-commit run --all` to run the hooks without commiting.
Use `pre-commit autoupdate` to update the repo `rev` if you experience any problems running the hooks.

## List of hooks available
- `Black`: Formats your staged files with Black formatter ([black](https://github.com/python/black) should be installed and configured in your project).
- `Flake8`: Runs `flake8` linter to find any problems with file formatting according to specified rules [flake8](http://flake8.pycqa.org/en/latest/).
- autopep8: Automatically formats Python code to conform to the PEP 8 style guide with [autopep8](https://github.com/hhatto/autopep8)
- `Pytest`: Runs `pytest` with flags `-sv`. It means that tests will be run with no capture and verbose.
- `shellcheck`: Runs [shellcheck](shellcheck.net) which lints shell/bash scripts.
- `isort`: Automatically sort Python imports.
- `pydocstyle`: Static analysis tool for checking compliance with Python docstring conventions.
- and many more - checkout the `.pre-commit-config.yaml` files.

## Notes
- Be careful using different linters / formatters at the same time (like `black`, `autopep8` and flake8`). They may have different conflicts so in order to use them together you should solve them first or have a configuration file handy.

## Additional info
Find more about pre-commit hooks [here](https://pre-commit.com/).

## Features

- Use `black` to autoformat
- Use `flake8` to run static analysis tests (black doesn't fix everything)
- Have your CI separated into 2 pipelines
    1. Run `flake8` and `pytest`
    2. To publish
- Have CI tests pass to be able to merge to master


## Reference
* [Why You Need To Stop Using Git-Hooks](https://blog.mphomphego.co.za/blog/2019/10/03/Why-you-need-to-stop-using-Git-Hooks.html)
* [Python workflow using pre-commits](https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/)
* [pre-commit](https://github.com/pre-commit/pre-commit-hooks)
* [pre-commit-introduction](https://pre-commit.com/#intro)
