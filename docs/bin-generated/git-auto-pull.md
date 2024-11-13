% git-auto-pull(1) Version Latest | git-auto-pull
# git-auto-pull

## DESCRIPTION

Integrate the changes from an upstream branch
(ie stash if needed and pull)

ie [pull auto-stash](#note-on-rebase-autostash) but with all `pull` type.

The `AutoPull` name is to stay in the same fashion as `AutoCommit`

## SYNOPSIS

Easy AutoPull
```bash
git-auto-pull
```

## TIP

You can add it as alias in your `~.gitconfig`
Example with `ap` that stands for `auto pull`
```ini
[alias]
ap = "!git-auto-pull"
```

## Note on Rebase AutoStash

Pull has also a [rebase auto-stash option](https://git-scm.com/docs/git-pull/2.17.0#Documentation/git-pull.txt---autostash)
```bash
git pull --rebase --autostash
```
This script does not care the type of change integration, it works also with a `merge`

You can also automate your `git pull` as `--rebase --autostash` via configuration.
```bash
git config [--global] pull.rebase true
git config [--global] rebase.autoStash true
```


