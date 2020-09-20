# CodeCommit Hands On
## Objectives
- Have some hands on labs for DevOps Professional Certification, automating the creation of resources needed for CodeCommit Lessons. 
- Checking useful git commands to work on AWS CodeCommitgit repositories.



## Common git commands

```
git config --global user.email "email@domain.com"
git config --global user.name "Email Name"
git add file1.txt
git commit -m "Message for the commit"
git remote
git branch : list local branches
git branch -r : list remote branches
git diff --stat origin/master
git push origin master

git pull origin master

## create a branch
git branch <branch_name>: Creates a new branch
git checkout -b <branch_name> : Creates a branch and switches into it
git checkout <branch>
git branch -d <branch_name> : delete a branch
git merge <branch_name> : merge <branch_name> into current branch
```

## Git tags
```
git tag <tag name> <commitId> : create a tag
git tag : list tags
git tag -d <tag_name> : delete a tag
git show <tag_name> : details about tag and commit associated

*** managing tags
git push origin <tag_name> 
git ls-remote --tags
git fetch --tags
```