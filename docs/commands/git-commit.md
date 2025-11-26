% git-commit(1) Version ${VERSION} | git-commit

# git-commit

## DESCRIPTION

`git-commit` commit without the hassle.

## HOW

It performs at once a `git`:

* pull with [git-pull](git-pull.md) if commits have not been integrated from remote. See [why](#why-we-check-for-remote-commit)
* `add` all modified files
* [prepare](git-prepare.md) the modified files
* `commit`
* and `push`

# EXAMPLE

* With an automatically generated message from the files in the commit

```bash
git-commit
```

* For all repositories under the [repo home directory with git exec](git-exec.md) with a [gc git alias](#git-alias)

```bash
git-exec c "My Commit Message"
```

# SYNOPSIS

${SYNOPSIS}

# TIP

## AMEND

If you modify some file and want to put them back in the last commit, just execute [git-amend](git-amend.md)

```bash
git-amend
```

# ALIAS

## Git Alias

You can add it as Git alias in your `~/.gitconfig`.

```ini
[alias]
  c = "!git-commit"
```

Then you can use it

* with `git`

```bash
git c
```

* with [git-exec](git-exec.md)

```bash
git-exec c
```

## Bash Alias

You can add it as bash alias in your `~/.bashrc`

```bash
alias gc = "git-commit"
```

# Why we check for remote commit

If the repository does not check for non-integrated remote commits via [git hooks (git-prepare)](git-prepare.md)
support, the push to the remote will be refused.
