# Git X - A collection of Git Plugins Extension 

## About

`GitX` is a collection of Git command Extensions.

## Most Useful Extensions

### Git-Exec - Multiple-repository execution

The most useful one is [git exec](docs/bin-generated/git-exec.md). This extension permits to
execute a git command against multiple repositories at once.

You can then manage a mono-repository where all subdirectories are an independent git repository.

### Git-Hosting-Backup - Backup your repositories

Don't get lockup of your Git Hosting repository if you lose your account.
Create backup with [git hosting backup](docs/bin-generated/git-hosting-backup.md)
so that you are always in control.

## Command List

* [git auto-commit](docs/bin-generated/git-auto-commit.md) - Pull, add, commit and push in one command, no argument needed
* [git auto-pull](docs/bin-generated/git-auto-pull.md) - Stash, Pull in one command
* [git commit-status](docs/bin-generated/git-commit-status.md) - Shows the commit status (to push/to merge)
* [git exec](docs/bin-generated/git-exec.md) - Execute a command against multiple repositories at once
* [git hosting](docs/bin-generated/git-hosting.md) - Main entry for Git Hosting Command
* [git hosting backup](docs/bin-generated/git-hosting-backup.md) - Backup your repositories on a Git Hosting Service such as GitHub
* [git last](docs/bin-generated/git-last.md) - Shows the last commit
* [git-last-delete](docs/bin-generated/git-last-delete.md) - Delete the last commit and put the files back in the working area
* [git log pretty](docs/bin-generated/git-log-pretty.md) - Shows the commit logs in a pretty way
* [git status-human](docs/bin-generated/git-status-human.md) - Print the status in a human way (ie one letter status explained)
* [git restart](docs/bin/git-restart.md) - Restart with a clean state (as `git clone`)


## Installation

### Docker

[Docker](https://github.com/gerardnico/git-x/pkgs/container/git-x)

```bash
docker run \
  --rm \
  ghcr.io/gerardnico/git-x:latest
```

### HomeBrew
 
Mac / Linux / Windows WSL with HomeBrew

```bash
brew install --HEAD gerardnico/tap/gitx
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
