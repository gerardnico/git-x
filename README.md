# Git X - A collection of Git Plugins Extension 

## About

`GitX` is a collection of Git command Extensions.


## Command List

* [git auto-commit](build/docs/bin/git-auto-commit.md) - Pull, add, commit and push in one command, no argument needed
* [git auto-pull](build/docs/bin/git-auto-pull.md) - Stash, Pull in one command
* [git commit-status](build/docs/bin/git-commit-status.md) - Shows the commit status (to push/to merge)
* [git exec](build/docs/bin/git-exec.md) - Execute a command against multiple local repositories at once
* [git service](build/docs/bin/git-service.md) - List the repositories of a Git Hosting Service
* [git service backup](build/docs/bin/git-service-backup.md) - Backup your repositories on a Git Hosting Service
* [git status-human](build/docs/bin/git-status-human.md) - Print the status in a human way (ie one letter status explained)
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
# Add the libraries directory into your path in your `.bashrc` file
export PATH=$(brew --prefix bashlib)/lib:$PATH
```


## Other Git Plugin Command Projects

* [git-extras commands](https://github.com/tj/git-extras/blob/main/Commands.md)
* [git-standup command](https://github.com/kamranahmedse/git-standup) - Already installed by git-extras
* [Git Stats command](https://github.com/arzzen/git-quick-stats)
* [Git Absorb command: Don't create new commit](https://github.com/tummychow/git-absorb/)
* [Git Undo command](https://github.com/Bhupesh-V/ugit) - Conflict with git-extras
* [LazyGit Terminal GUI](https://github.com/jesseduffield/lazygit)
