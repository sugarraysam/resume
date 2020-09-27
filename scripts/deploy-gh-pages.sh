#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

cd public

if [ -n "${GITHUB_BOT_TOKEN}" ]; then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo "${GITHUB_BOT_TOKEN}" >~/.git-credentials

    git config credential.helper store
    git config user.email "sugarraysam-resume-bot@users.noreply.github.com"
    git config user.name "sugarraysam-resume-bot"
fi

git add .
git commit -m "Rebuild site"
git push --force origin HEAD:master
