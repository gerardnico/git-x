% git-amend(1) Version Latest | git-amend

# git-amend

## DESCRIPTION

Add actual modified and added files to the last commit.

[git commit amend](https://git-scm.com/book/id/v2/Git-Tools-Rewriting-History#_git_amend)
that always work (even if it was pushed to the remote)

## How?

* Soft reset of the last commit. ie:
  * Delete the commit (locally and remotely)
  * Put the files of the deleted commit in the index
* Recreate a commit with all files
* If the last commit was tagged
  * Delete the tag
  * Delete the GitHub release

## SYNOPSIS

${SYNOPSIS}

## See also

* [git commit amend official documentation](https://git-scm.com/book/id/v2/Git-Tools-Rewriting-History#_git_amend)
* [git absorb plugin command](https://github.com/tummychow/git-absorb/) that tries do the same job
