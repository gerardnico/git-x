% git-amend(1) Version 0.1.0 | git-amend

# git-amend

## DESCRIPTION

Recreate the last commit with the actual modified and added files.

It's a [git commit amend](https://git-scm.com/book/id/v2/Git-Tools-Rewriting-History#_git_amend)
that always work (even if the commit was pushed to the remote)

## How?

* Soft reset of the last commit. ie:
  * Delete the commit (locally and remotely)
  * Put the files of the deleted commit in the index
* Recreate a commit with all files
* If the last commit was tagged
  * Delete the tag
  * Delete the GitHub release

## SYNOPSIS

```bash
Add files to the last commit
git-amend  [Commit Message]
```
If the commit message is not given, it will take the message of the last commit.

## See also

* [git commit amend official documentation](https://git-scm.com/book/id/v2/Git-Tools-Rewriting-History#_git_amend)
* [git absorb plugin command](https://github.com/tummychow/git-absorb/) that tries do the same job
