% git-exec(1) Version Latest | git-exec
# Git Exec

Execute a git command against multiple local repositories at once

## DESCRIPTION

Execute a git command against all local repositories
stored under the directory located by the `$GITX_REPOS_HOME` environment variable

## EXAMPLE

* Shows the status of all repositories

```bash
git exec status --short
```

* `Add, Commit and Push` on all repositories

```bash
git exec auto-commit
```

* Perform a commit only again the `my-repo` repository

```bash
git exec my-repo commit -m "My Commit"
```

## CONFIG

You should set the environment variable `GITX_REPOS_HOME` to a valid directory
that host multiple repositories as sub-directories.

## SYNOPSIS

```bash
git exec [repo name] <git sub-command>
```

where:

* `repo name`, optional when specified the command will execute only against this repository (the `repo name` is the name of directory)
* `git sub-command` is any git sub-command

## TIP

You can add it as alias in your `~.gitconfig`
```ini
[alias]
x = "!git-exec"
```


