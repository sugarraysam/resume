#!/bin/bash

set -e
set -x

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Travis CI/CD, use unpriviledged bot account
if [ -n "${GITHUB_BOT_TOKEN}" ]; then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo "${GITHUB_BOT_TOKEN}" >~/.git-credentials

    git config credential.helper store
    git config user.email "sugarraysam-resume-bot@users.noreply.github.com"
    git config user.name "sugarraysam-resume-bot"
fi

# make sure deploy directory exists
mkdir -p public
cd public

git add .
git commit -m "Rebuild site" || true
git push --force origin HEAD:master
