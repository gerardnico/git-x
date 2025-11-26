% git-undo(1) Version ${VERSION} | git-undo

# NAME

Undo the last commit

# HOW IT WORKS

* Delete the last commit locally and remotely
* Put the files of the deleted commit back into the staging area
* If the commit is:
  * tagged, the tags will also be deleted
  * released, the GitHub release will also be deleted

## SYNOPSIS

${SYNOPSIS}

# ALIAS TIP

## GIT ALIAS

You can add it as alias in your `~.gitconfig`.

Example with `u`

```ini
 [alias]
    u = "!git-undo"
```

Then you can call it with

```bash
git u
```

## BASHRC ALIAS

You can add it as alias in your `~/.bashrc`.

```bash
alias gu = "git-undo"
```
