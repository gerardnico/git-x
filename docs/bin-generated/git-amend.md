% git-amend(1) Version Latest | git-amend

# git-amend

## DESCRIPTION

Add actual files present in the index (staged and not staged) to the last commit.

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
