#!/bin/bash
#run this when doing bug-fix releases - do this from release branch
# this is inspired by https://www.braintreepayments.com/blog/our-git-workflow/

if [ "$#" -ne 2 ]; then
    echo "Please specify release and version !"
    echo "gitbugfixrelease.sh v0.1_release v0.0.3"
    exit
fi

repo_release = $1
repo_version = $2

echo release : $repo_release
echo version : $repo_version

# checking before commit
    
vim VERSION
vim CHANGELOG

git add -i

git status

echo "Please make sure, that you are working on $repo_release branch and that all bugs are fixed ;)"
read -p "Moving to $repo_release branch and continue committing ... ? " -n 1 -r

git checkout $repo_release # go into release
git merge master
vim VERSION
vim CHANGELOG
git add -i

git commit -a

#git checkout github_master
#git merge --squash $repo_release # could be added--strategy-option theirs

#echo git commit -m \"$repo_version\"
#git commit -m \"$repo_version\"

#echo git tag  $repo_version -m "$repo_version"
#echo git tag  $repo_version -m \"$repo_version\"
git tag  $repo_version -m \"$repo_version\"

# pushing github_master (=current HEAD ) to master (master) on github
# git push --tags destination source_branch:target_branch

#git push --tags github HEAD:$repo_release

#git push --tags github github_master
read -p "Continue committing ... ? " -n 1 -r

# merging github_master back to release
#git checkout $repo_release
#git merge github_master

# also pushing everything to release
git push --tags gitlab HEAD:$repo_release

git push --tags github HEAD:$repo_release
# ?? git push github $repo_release

read -p "Continue committing ... ? " -n 1 -r

# merging release back into master
git checkout master
#git merge $repo_release

git branch

