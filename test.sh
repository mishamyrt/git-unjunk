#!/bin/bash
REPO=".test"
FILE="test.txt"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 

mkdir -p $REPO
cd $REPO
touch test.txt
git init
git add $FILE
git commit -m "Commit message"
for i in {1..5}
do
   git checkout -b branch-$i
done
git checkout master
../bin/git-unjunk -y
COUNT=$(git branch | wc -l | xargs)
if (( $COUNT > 1 )); then
    printf "${RED}Failed${NC}\n"
    exit 1
else
    printf "${GREEN}Passed${NC}\n"
    exit 0
fi