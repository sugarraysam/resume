#!/bin/bash

set -e
set -x

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# make sure public was created
if [ ! -d "public" ]; then
    echo "You need to run '$ hugo' to compile the website in 'public/'..."
    exit 1
fi

cd public

# Travis CI/CD, use unpriviledged bot account
if [ -n "${GITHUB_BOT_TOKEN}" ]; then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo "${GITHUB_BOT_TOKEN}" >~/.git-credentials

    git config credential.helper store
    git config user.email "sugarraysam-resume-bot@users.noreply.github.com"
    git config user.name "sugarraysam-resume-bot"
fi

git add .
git commit -m "Rebuild site" || true
git push --force origin HEAD:master
