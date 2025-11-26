% git-prepare(1) Version ${VERSION} | git-prepare

# NAME

Lint, check and prepare the next commit with [pre-commit](https://pre-commit.com/)

## HOW

It:

* adds all index files in the next commit (stage them)
* Run `pre-commit` to execute all `git hooks` if [found](#pre-commit-and-exit-status)

## SYNOPSIS

${SYNOPSIS}

## PRE-COMMIT AND EXIT STATUS

* If the `pre-commit` config file `.pre-commit-config.yaml` is not found,
  this script will exit successfully with a warning.
* If the conf file is found but not `pre-commit`, this script will fail.
* If a git hooks managed by `pre-commit` fails, this script will fail.
