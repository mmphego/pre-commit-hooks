#!/usr/bin/env bash
# Author: Mpho Mphego
# email: mpho@mphomphego.co.za
# Automatically prepend git commit with the Jira ticket link

if [ -z "$BRANCHES_TO_SKIP" ]; then
 # This way you can customize which branches should be skipped when pre-pending commit message.
  BRANCHES_TO_SKIP=(master develop test)
fi

BRANCH_NAME=$(git symbolic-ref --short HEAD | grep -o '[A-Z]\+-[0-9]\+')
if [ -n "${BRANCH_NAME}" ]; then
    BRANCH_NAME="${BRANCH_NAME##*/}"
    BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
    BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" "$1")

    if [ -n "${BRANCH_NAME}" ] && ! [[ "${BRANCH_EXCLUDED}" -eq 1 ]] && ! [[ "${BRANCH_IN_COMMIT}" -ge 1 ]]; then
        echo -e "\nJIRA: [$BRANCH_NAME](https://skaafrica.atlassian.net/browse/${BRANCH_NAME})\n" >> "${1}"
    fi

fi
