#!/bin/bash

# Paths
repository_folder='.test'
file='test.md'
unjunk='../bin/git-unjunk'

# Colours
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m' 

# Initializes new repository with single commit
initialize_repo () {
    rm -rf $repository_folder
    mkdir $repository_folder
    cd $repository_folder
    git init

    touch "$file"
    git add "$file"
    git commit -m "Initial commit"
}

# Creates 5 branches from current commit
create_branches () {
    for i in {1..5}
    do
        git checkout -b "branch-$i"
    done
}

# Prepare environment
initialize_repo
create_branches

# Perform test
git checkout master
$unjunk -y
branches_count=$(git branch | wc -l | xargs)

if (( $branches_count > 1 )); then
    echo -e "${red}Failed${nc}"
    exit 1
else
    echo -e "${green}Passed${nc}"
    exit 0
fi