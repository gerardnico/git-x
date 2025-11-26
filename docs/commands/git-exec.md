% git-exec(1) Version ${VERSION} | git-exec

# NAME

Execute a git command against multiple local repositories at once

# DESCRIPTION

Execute a git command against local repositories

# EXAMPLE

* Shows the status of all dirty repositories

```bash
git-exec status --short
```

* Shows the status of all repositories

```bash
git-exec -f status --short
```

* [git-commit](git-commit.md) on all repositories where `gc` is a [gitconfig alias](git-commit.md#alias-tip)

```bash
git-exec gc
```

* Performs a commit only again the `my-repo` repository

```bash
git-exec my-repo commit -m "My Commit"
```

# CONF / ENV

You can define the location of the Git repositories with the following environment variables:

* `GITURE_REPOS_DIRS`: One or more directories separated by `:` where all sub-repositories are git repositories
* `GITURE_REPOS_FILE`: A file where each line is a path to a repository
* `GITURE_REPOS_PATH`: A path environment variable where each path is a git repository path separated by a colon.

Example in `.bashrc`

```bash
# All repositories are cloned in $HOME/code
export GITURE_REPOS_DIRS=$HOME/code/orga1:$HOME/code/orga2
# Add an extra repo such as the Homebrew tap repo and another
export GITURE_REPOS_PATH=/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/gerardnico/homebrew-tap:/path/to/another-repo
# Define the paths in a file (one path by line)
export GITURE_REPOS_DIR=$HOME/conf/giture-repo.txt
```

where `giture-repo.txt` is a file with one path by line. Example:

```
/path/to/my-first-repo
/path/to/my-second-repo
```

# SYNOPSIS

${SYNOPSIS}

# TIP

You can add it as alias in your `~.gitconfig`

```ini
[alias]
  gx = "!git-exec"
```

# MODE OF EXECUTION

By default, `git-exec` will execute only against a `dirty` repository.

A dirty repository is a repository that has:

* commits not pushed
* files modified (in the index)

To execute the git command against:

* all repositories, you need to force it with the `-f` or `--force` option
* one repository, you need to pass the repository as first argument.
