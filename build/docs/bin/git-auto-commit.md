% git-auto-commit(1) Version Latest | git-auto-commit
# git-auto-commit

## DESCRIPTION

A commit utility function for `Git Add, Commit and Push`

Before the commit, these command checks if there is no remote commit
to integrate. If this is the case, it will execute a `git auto-pull`

# EXAMPLE

* For one repository with an automatically generated message from the files in the commit

```bash
git auto-commit
```

* For all repositories under the repo home directory with `git exec`

```bash
git exec auto-commit "My Commit Message"
```

# SYNOPSIS

```bash
git-auto-commit [Commit Message]
```
If the commit message is not given, it will be generated with the files in the commit.

## TIP

You can add it as alias in your `~.gitconfig`
Example with `acp` that stands for `add, commit, push`
```ini
[alias]
acp = "!git-auto-commit"
```


