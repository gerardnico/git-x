% git-commit(1) Version ${VERSION} | git-commit

# git-commit

## DESCRIPTION

`git-commit` commit without the hassle.

## HOW

It performs at once a `git`:
* `pull` if commits have not been integrated from remote
* `add` all modified files
* `commit`
* and `push`

# EXAMPLE

* With an automatically generated message from the files in the commit

```bash
git-commit
```

* For all repositories under the [repo home directory with git exec](git-exec.md)

```bash
git-exec git-commit "My Commit Message"
```

# SYNOPSIS

${SYNOPSIS}

## TIP

### AMEND

If you forgot to add modifications, just execute [git-amend](git-amend.md)

```bash
git-amend
```

### ALIAS TIP

You can add it as alias:

* in your `~/.gitconfig`. Example with `acp` that stands for `add, commit, push`

```ini
[alias]
  acp = "!git-commit"
```

* in your `~/.bashrc`

```bash
alias gc = "git-commit"
```
