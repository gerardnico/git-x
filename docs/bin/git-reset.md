% git-reset(1) Version Latest | git-reset

# NAME

Reset as if it was a clean `git clone`
Cancel all modifications and start fresh

## HOW

This function performs:

* a reset hard
* and a clean

# SYNOPSIS

${SYNOPSIS}

# TIP

You can add it as alias

* in your `~.gitconfig`

```ini
[alias]
  gr = "!git-reset"
```

* in your `~.bashrc`

```bash
alias gr = git-reset
```
