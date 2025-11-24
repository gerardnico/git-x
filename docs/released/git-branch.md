% git-branch(1) Version 0.1.0 | git-branch
# git-branch

## DESCRIPTION

Branch listing or checkout

* without arguments, shows all branches
* with the name of the `branch`, perform a [checkout](#checkout) that will always work

## CHECKOUT

A branch checkout that will always work

  * stash actual changes
  * create the branch if it does not exist
  * checkout the branch
  * un-stash


## SYNOPSIS

List, switch to or create a branch
```bash
git-branch  [branch_name]
```
* without branch name, the local and remotes branches are list
* with a branch name
  * the branch is created if it does not exist
  * the work is stashed
  * the working branch is changed
  * the optional stashed work is popped
