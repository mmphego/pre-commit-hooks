#!/bin/bash
# Install pre-commit hooks globally
# Author: Mpho Mphego <mpho112@gmail.com>

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

gprint (){
    echo "${GREEN}${1}${NORMAL}";
}

rprint (){
    echo -e "${RED}${1}${NORMAL}\n";
}

if ! command -v pre-commit >/dev/null; then
    rprint "pre-commit command is missing!!"
    rprint "Run: > pip install pre-commit"
    exit 1
fi


uninstall() {
    gprint "Deleting pre-commit hooks in ${DIR}";
    pre-commit uninstall;
}

install() {
    gprint "Do you want to install 'pre-commit hooks' every-time you create or clone repositories? [y/n] "
    read -r response_global_install
    if [[ "${response_global_install}" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        git config --global init.templatedir "${PWD}";
        pre-commit init-templatedir "${PWD}";
        gprint "Now whenever a repository is cloned or created, it will have the hooks set up already!"
    fi
    echo

    gprint "Do you want to install 'commit-msg-template' ? "
    gprint "If unsure what this is, goto: http://bit.ly/2My37A1  [y/n] "
    read -r read_commit_msg
    if [[ "${read_commit_msg}" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        COMMIT_TEMPLATE="${PWD}/commit-msg-template/commit-msg-template.txt"
        if [ -f "${COMMIT_TEMPLATE}" ]; then
            git config --global commit.template "${COMMIT_TEMPLATE}";
        fi
    fi
    echo

    gprint "Do you want to install 'pre-commit' across all your repos? [y/n]"
    read -r all_repos
    if [[ "${all_repos}" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        find /home -name ".git" -type d -prune -exec dirname {} \; | while read -r DIR;
        do
            pre-commit install -f --allow-missing-config >/dev/null 2>&1;
            if [ -f ".pre-commit-config.yaml" ]; then
                cp .pre-commit-config.yaml "${DIR}" || true;
            fi
            gprint "'pre-commit' hook installed: ${DIR}";
        done
    else
        gprint "Installing 'pre-commit' on your current repo."
        pre-commit install
        gprint "'pre-commit' hook installed: ${DIR}";
    fi
    [ $? -eq 0 ] && gprint "####################### DONE #######################"
}

# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null; then
    # call arguments verbatim
    "$@"
else
    # Show a helpful error
    if [ "$1" == '' ]; then
        rprint "'$1' is not a known function name" >&2
    fi
    gprint "Available functions: uninstall and install";
    gprint "Usage: $0 uninstall or $0 install"
    exit 1;
fi
