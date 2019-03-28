#!/bin/bash
#run this for a new release from master branch
# $repo_release : release (e.g. v0.1_release)
# $repo_version : version (e.g. v0.0.3)
# this is inspired by https://www.braintreepayments.com/blog/our-git-workflow/

echo script version 20190113

if [ "$#" -ne 2 ]; then
    echo "Please specify release and version !"
    echo "gitrelease.sh v0.1_release v0.0.3"
    exit
fi

repo_release=$1
repo_version=$2

# checking before committing:

git log 
git status
vim VERSION
vim CHANGELOG

# check, if github remote exists 
echo release : $repo_release
echo version : $repo_version

git remote show

read -p "Continue committing ...on gitLab ? " -n 1 -r

git commit -a

git checkout $repo_release # go into release

git merge master

vim VERSION
vim CHANGELOG

git add -i
git commit -a

echo ----- gitLab ------

git checkout gitlab_master
git merge --squash $repo_release # could be added--strategy-option theirs

echo git commit -m \"$repo_version\"
git commit -am \"$repo_version\"

echo git tag  $repo_version -m "$repo_version"
echo git tag  $repo_version -m \"$repo_version\"
git tag  $repo_version -m \"$repo_version\"

# pushing gitlab_master (=current HEAD ) to master (master) on gitlab
# git push --tags destination source_branch:target_branch

git push --tags gitlab HEAD:master
#git push --tags gitlab gitlab_master

# merging gitlab_master back to release
git checkout $repo_release
git merge gitlab_master

# also pushing everything to release
git push --tags gitlab HEAD:$repo_release
# ?? git push gitlab $repo_release

read -p "Continue committing on gitHub ... ? " -n 1 -r


echo ----- gitHub ------

git checkout github_master
git merge --squash $repo_release # could be added--strategy-option theirs

echo git commit -m \"$repo_version\"
git commit -am \"$repo_version\"

echo git tag  $repo_version -m "$repo_version"
echo git tag  $repo_version -m \"$repo_version\"
git tag  $repo_version -m \"$repo_version\"

# pushing github_master (=current HEAD ) to master (master) on github
# git push --tags destination source_branch:target_branch

git push --tags github HEAD:master
#git push --tags github github_master

# merging github_master back to release
git checkout $repo_release
git merge github_master

# also pushing everything to release
git push --tags github HEAD:$repo_release
# ?? git push github $repo_release

read -p "Continue committing ... ? " -n 1 -r

# merging release back into master
git checkout master
git merge $repo_release

# show where I am
git branch


