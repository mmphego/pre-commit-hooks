# Pre-Commit Hooks

A personal collection of pre-commit hooks that can makes my life easier :)

The script will:

1. Find all directories under the `/home` which contain any `.git` directory
2. Install the hooks into them
3. Sets `init.templateDir` to point to `templates/git-commit-template.txt`


## Pre-commit Installation
```
# clone this repository and install pre-commit hooks
# change directory

# Install pre-commit package
pip install -r requirements.txt

# verify and mondify .pre-commit-config.yaml for your python enviroment (default Python3.6)
notepad .pre-commit-config.yaml

# Install pre-commit to your repository
pre-commit install
```

## Skip Checker to Commit
Skip the rule checker `pytest` with the following command:
```
SKIP=pytest pre-commit run --all-files
```

## Pre-commit contents
If you want to "skip", "ignore" or "add" the git hook rule, trying to modify pre-commit config file and take off the checker id in `.pre-commit-config.yaml` and run `pre-commit install` again.



## Installation

### Install the requirements.
```bash
pip install pre-commit
cd ~/<your-project>
pre-commit install
touch .pre-commit-config.yaml
```

### 2. Edit your `.pre-commit-config.yaml` to add hooks from this project:
 - Add (see the list of available hooks below):
  ```
    - repo: git@github.com:jetbridge/pre-commit-hooks.git
      rev: master
      hooks:
        - id: black
        - id: flake8
        - id: pytest
  ```
 - Save `.pre-commit-config.yaml`
 - Stage it:
 ```
 git add .pre-commit-config.yaml
 ```

## Usage
Use `git commit` command to run the hooks and commit staged files.
Use `pre-commit run` to run the hooks without commiting.
Use `pre-commit autoupdate` to update the repo `rev` if you experience any problems running the hooks.

## List of hooks
### Black
Formats your staged files with Black formatter ([black](https://github.com/python/black) should be installed and configured in your project).
If some files have to be fixed, it will fix them and apply `git add` on them so your commit will not be rejected.
### Flake8
Runs flake8 linter to find any problems with file formatting according to specified rules ([flake8](http://flake8.pycqa.org/en/latest/) should be installed and configured in your project).
### Pytest
Runs pytest with flags `-xq`. It means that tests will be run in quiet mode and stopped on the first error or failure.

## Notes
 - Please note that all unstaged files will be stashed once you ran the hooks.
 - Be careful using different linters / formetters at the same time (like `black` and `flake8`). They may have different conflicts so in order to use them together you should solve them first.

## Additional info
Find more about pre-commit hooks [here](https://pre-commit.com/).

## Happy coding!



- use black to autoformat

- use flake8 to run formatting tests (black doesn't fix everything)

- have CI separated into 2 workflows, 1. to run flake8 and pytest, 2. to publish

- have CI enabled on pushes to open PRs, with workflow 1 running on any branch (sometimes using approval or filtered branches)

- have CI tests pass to be able to merge to master

- have CI on commits to master perform deployment (ship package to a repo like PyPi) (workflow 2)



## Reference
* [Python workflow using pre-commits](https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/)
* [pre-commit](https://github.com/pre-commit/pre-commit-hooks)
* [pre-commit-introduction](https://pre-commit.com/#intro)
