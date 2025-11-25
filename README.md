# Git X - A collection of Git Plugins eXtension

## About

`GitX` is a collection of Git command Extensions.

## How this repository can help you?

This repository contains commands that will help you:

* [in your git flow](#git-flow-commands)
* [execute a command against multiple repositories](#multiple-repository-execution)
* [backup you repositories](#backup-your-git-repositories)

## How the git flow command works?

* Create a feature branch

```bash
git-branch my-feature
# with alias
gb my-feature
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
git-amend # amend the last commit
# or with alias
ga "optional commit message"
```

* Check your commit on the feature branch

```bash
git-feature-log
# with alias
gfl
```

* Merge your feature

```bash
git-feature-merge
# with alias
gfm
```

## Commands

### Git-Flow Commands

Git Flow commands are command used in a `git flow` ie:

* to add, prepare, undo commit
* create, merge branch

Common rules applied by all commands:

| No need to     | Why?                                                                                                                                                                    |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| pass arguments | We recreate the official git commands without arguments by default                                                                                                      |
| sync           | Local and remote repo are synced immediately <BR> The commands suppose that you are working alone on a `feature` branch so that they can delete a remote commit safely. |
| add files      | All files found in the index go to the next commit (ie not staged files are automatically staged)                                                                       |

The `2 letters alias` column in the below list is a proposed alias that you can create in your `.bashrc`. Example:

```bash
alias ga='git-amend'
```

List:

| 2 letters alias | Command                                                   | Description                                                                       |
|-----------------|-----------------------------------------------------------|-----------------------------------------------------------------------------------|
| `ga`            | [git-amend](docs/released/git-amend.md)                   | Recreate the last commit with the actual modified files                           |
| `gb`            | [git-branch](docs/released/git-branch.md)                 | Branch listing, switching and creation                                            |
| `gc`            | [git-commit](docs/released/git-commit.md)                 | Pull, add, commit and push in one command, no argument needed                     |
| `gfd`           | [git-feature-delete](docs/released/git-feature-delete.md) | Delete a feature branch                                                           |
| `gfl`           | [git-feature-log](docs/released/git-feature-log.md)       | Shows the commits of the feature branch since the branching                       |
| `gfm`           | [git-feature-merge](docs/released/git-feature-merge.md)   | Merge a feature branch to the default branch                                      |
| `gfs`           | [git-feature-squash](docs/released/git-feature-squash.md) | Squash all commits of a feature branch                                            |
| `gl`            | [git-log](docs/released/git-log.md)                       | Shows the last commit                                                             |
| `gll`           | [git-log-all](docs/released/git-log-all.md)               | Shows all commits                                                                 |
|                 | [git-pull](docs/released/git-pull.md)                     | Stash, Pull, un-stash in one command                                              |
| `gp`            | [git-prepare](docs/released/git-prepare.md)               | Check the files against git-hooks with pre-commit                                 |
|                 | [git-remote](docs/bin/git-remote.md)                      | Shows remote status information (commit sync, GitHub actions runner)              |
| `gr`            | [git-reset](docs/bin/git-reset.md)                        | Restart with a clean state (as a `git clone`)                                     |
| `gs`            | [git-status](docs/released/git-status.md)                 | Shows the working area status                                                     |
| `gtd`           | [git-tag-delete](docs/released/git-tag-delete.md)         | Delete a tag                                                                      |
| `gu`            | [git-undo](docs/released/git-undo.md)                     | Delete the last commit (tagged or not) and put the files back in the working area |

### Multiple-repository execution

This extension permits to
execute a git command against multiple repositories at once.

You can then:

* check the status of all your repo at once. Example:

```bash
git-exec status --short
alias gxs="git-exec status --short"
```

* manage a mono-repository where all subdirectories are an independent git repository.

See [git exec documentation](docs/released/git-exec.md) - Execute a command against multiple repositories at once

### Backup your git repositories

Don't get lockup of your Git Hosting repository if you lose your account.
Create backup with [git hosting backup](docs/released/git-hosting-backup.md)
so that you are always in control.

* [git hosting](docs/released/git-hosting.md) - Main entry for Git Hosting Command
* [git hosting backup](docs/released/git-hosting-backup.md) - Backup your repositories on a Git Hosting Service
  such as GitHub

## Installation

### Docker

[Docker](https://github.com/gerardnico/git-x/pkgs/container/git-x)

```bash
docker run \
  --rm
  ghcr.io/gerardnico/git-x:v0.1.0 \
  git-log --help
```

### HomeBrew

Mac / Linux / Windows WSL with HomeBrew

```bash
brew install gerardnico/tap/gitx
```

## Other Git Plugin Command Projects

* [git-extras commands](https://github.com/tj/git-extras/blob/main/Commands.md)
* [git-standup command](https://github.com/kamranahmedse/git-standup) - Already installed by git-extras
* [Git Stats command](https://github.com/arzzen/git-quick-stats)
* [Git Absorb command: Don't create new commit](https://github.com/tummychow/git-absorb/)
* [Git Undo command](https://github.com/Bhupesh-V/ugit) - Conflict with git-extras
* [LazyGit Terminal GUI](https://github.com/jesseduffield/lazygit)

## How to contribute

See [CONTRIB](contrib/CONTRIB.md)
