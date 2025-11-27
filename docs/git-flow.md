---
sidebar_label: 'Git Flow'
---

# Git-Flow Commands

Git Flow commands are commands used in a `git flow` ie:

* to add, prepare, undo commits
* create and merge branches

## How the git flow command works together?

* Create a feature branch

```bash
git-branch my-feature
# with alias
gb my-feature
```

* Makes changes (modification, deletion)
* Check your changes

```bash
git status
# with alias
gs
```

* Check the added or modified files against `git hooks` with `pre-commit` (missing link, styling, ...)

```bash
git-prepare
# with alias
gp
```

* Bad modification happens. Get in a clean state as a `git clone`

```bash
git-reset
# with alias
gr
```

* Commit or amend (ie recreate the last commit with your modified files)

```bash
##########
# commit
##########
git-commit "optional commit message"
# or with alias
gc "optional commit message"

##########
# amend
##########
git-amend # amend the last commit with the last commit message
# or with alias
ga "optional new commit message"
```

* Check your last commit

```bash
git-log
# with alias
gl
```

* Check all your commits on the feature branch

```bash
git-feature-log
# with alias
gfl
```

* Squash all commits on the feature branch to one (before merge if wanted)

```bash
git-feature-squash
# with alias
gfs
```

* Merge your feature branch into `main`

```bash
git-feature-merge
# with alias
gfm
```

* Delete a tag and the GitHub release

```bash
git-tag-delete
# with alias
gtd
```

## Common rules

Common rules applied by all commands

| No need to     | Why?                                                                                                                                                                     |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| pass arguments | We recreate the official git commands without arguments by default                                                                                                       |
| sync           | Local and remote repo are synced immediately <br/> The commands suppose that you are working alone on a `feature` branch so that they can delete a remote commit safely. |
| add files      | All files found in the index go to the next commit (ie not staged files are automatically staged)                                                                        |

The `2 letters alias` column in the below list is a proposed alias that you can create in your `.bashrc`. Example:

```bash
alias ga='git-amend'
```

## List

| 2 letters alias | Command                                              | Description                                                                       |
|-----------------|------------------------------------------------------|-----------------------------------------------------------------------------------|
| `ga`            | [git-amend](commands/git-amend.md)                   | Recreate the last commit with a new message and/or the actual modified files      |
| `gb`            | [git-branch](commands/git-branch.md)                 | Branch listing, switching and creation                                            |
| `gc`            | [git-commit](commands/git-commit.md)                 | Pull, add, commit and push in one command, no argument needed                     |
| `gfd`           | [git-feature-delete](commands/git-feature-delete.md) | Delete a feature branch                                                           |
| `gfl`           | [git-feature-log](commands/git-feature-log.md)       | Shows the commits of the feature branch since the branching                       |
| `gfm`           | [git-feature-merge](commands/git-feature-merge.md)   | Merge a feature branch to the default branch                                      |
| `gfs`           | [git-feature-squash](commands/git-feature-squash.md) | Squash all commits of a feature branch                                            |
| `gl`            | [git-log](commands/git-log.md)                       | Shows the last commit                                                             |
| `gll`           | [git-log-all](commands/git-log-all.md)               | Shows all commits                                                                 |
|                 | [git-pull](commands/git-pull.md)                     | Stash, Pull, un-stash in one command                                              |
| `gp`            | [git-prepare](commands/git-prepare.md)               | Check the files against git-hooks with pre-commit                                 |
|                 | [git-remote](commands/git-remote.md)                 | Shows remote status information (commit sync, GitHub actions runner)              |
| `gr`            | [git-reset](commands/git-reset.md)                   | Restart with a clean state (as a `git clone`)                                     |
| `gs`            | [git-status](commands/git-status.md)                 | Shows the working area status                                                     |
| `gtd`           | [git-tag-delete](commands/git-tag-delete.md)         | Delete a tag and its GitHub release if any                                        |
| `gu`            | [git-undo](commands/git-undo.md)                     | Delete the last commit (tagged or not) and put the files back in the working area |
