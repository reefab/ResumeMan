#!/usr/bin/env bash

cd build

if [ ! -d .git ]; then
    echo "The following configuration options will be asked only once."
    echo "If you want to change them, delete the 'build/.git' directory."
    git init
    echo "github user name?"
    read name
    git config user.name $name
    echo "email?"
    read email
    git config user.email $email
    echo "repo name (default is 'resume' if empty) ?"
    read repo
    if [ "$repo" == "" ]; then
        repo="resume"
    fi
    git remote add origin git@github.com:$name/$repo.git
fi

git add .
git commit -m "Latest build upload"
git push --force origin master:gh-pages
