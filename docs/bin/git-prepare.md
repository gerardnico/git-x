% git-prepare(1) Version ${VERSION} | git-prepare

# NAME

Lint, check and prepare the next commit with [pre-commit](https://pre-commit.com/)

## HOW

It:

* adds all index files in the next commit (stage)
* Run `pre-commit` to execute all `git hooks`

## NO CONF FILE

If the `pre-commit` config file `.pre-commit-config.yaml` is not found,
this script will exit successfully with a warning.

## SYNOPSIS

${SYNOPSIS}
