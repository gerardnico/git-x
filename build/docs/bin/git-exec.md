% git-exec(1) Version Latest | git-exec
# NAME

Execute a git command against multiple local repositories at once

# DESCRIPTION

Execute a git command against all local repositories stored:
* under the directory located by the `` environment variable
* at the paths defined in the `` file

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

# CONFIG

You should set the environment variable `GITX_REPOS_HOME` to a valid directory
that host multiple repositories as subdirectories.

# SYNOPSIS

```bash
git exec [-f|--force] [repo name] <git sub-command>
```
where:
* `-f` or `--force` will force the execution against all repositories (not only the dirty ones)
* `repo name`, optional when specified the command will execute only against this repository (the `repo name` is the name of directory)
* `git sub-command` is any git sub-command

# TIP

You can add it as alias in your `~.gitconfig`
```ini
[alias]
x = "!git-exec"
```

# MODE OF EXECUTION

## DIRTY MODE (Default)
By default, `git exec` will execute only against a `dirty` repository.

A dirty repository is a repository that has:
* commits not pushed
* files modified (in the index)

To execute the git command against all repositories


# ENV

* `GIT_X_REPOS_DIR`: A directory where all repositories are stored
* `GIT_X_REPOS_FILE`: A file where each line is a path to a repository
* `GIT_X_REPOS_PATH`: A path environment variable where each path is a git repository path separated by a colon.