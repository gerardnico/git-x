% git-commit(1) Version Latest | git-commit

# git-commit

## DESCRIPTION

A commit utility function for `Git Add, Commit` and `Push`

# EXAMPLE

* For one repository with an automatically generated message from the files in the commit

```bash
git-commit
```

* For all repositories under the [repo home directory with git exec](git-exec.md)

```bash
git exec git-commit "My Commit Message"
```

# SYNOPSIS

${SYNOPSIS}

## TIP

You can add it as alias in your `~.gitconfig`
Example with `acp` that stands for `add, commit, push`

```ini
[alias]
  acp = "!git-commit"
```
