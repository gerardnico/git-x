% git-exec(1) Version Latest | git-exec
# NAME

Execute a git command against multiple local repositories at once

# DESCRIPTION

Execute a git command against local repositories

# EXAMPLE

* Shows the status of all dirty repositories

```bash
git exec status --short
```

* Shows the status of all repositories

```bash
git exec -f status --short
```

* `Add, Commit and Push` on all repositories

```bash
git exec auto-commit
```

* Perform a commit only again the `my-repo` repository

```bash
git exec my-repo commit -m "My Commit"
```

# CONF / ENV

You can define the location of the Git repositories with the following environment variables:

* `GIT_X_REPOS_DIR`: A directory where all sub-repositories are git repositories
* `GIT_X_REPOS_FILE`: A file where each line is a path to a repository
* `GIT_X_REPOS_PATH`: A path environment variable where each path is a git repository path separated by a colon.


Example in `.bashrc`
```bash
# All repositories are cloned in $HOME/code
export GIT_X_REPOS_DIR=$HOME/code
# Add an extra repo such as the Homebrew tap repo and another
export GIT_X_REPOS_PATH=/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/gerardnico/homebrew-tap:/path/to/another-repo
# Define the paths in a file (one path by line)
export GIT_X_REPOS_DIR=$HOME/conf/git-x-repo.txt
```
where `git-x-repo.txt` is a file with one path by line. Example:
```
/path/to/my-first-repo
/path/to/my-second-repo
```

# SYNOPSIS

```bash
git exec [-f|--force] [repo name] <git sub-command>
```
where:
* `-f` or `--force` will force the execution against all repositories (not only the dirty ones)
* `repo name`, optional when specified the command will execute only against this repository (the `repo name` is the name of the directory)
* `git sub-command` is any git sub-command such as `clone`, `push`, ...
* `-h|--help` to show this help

# TIP

You can add it as alias in your `~.gitconfig`
```ini
[alias]
gx = "!git-exec"
```

# MODE OF EXECUTION

By default, `git exec` will execute only against a `dirty` repository.

A dirty repository is a repository that has:
* commits not pushed
* files modified (in the index)

To execute the git command against:
* all repositories, you need to force it with the `-f` or `--force` option
* one repository, you need to pass the repository as first argument.
