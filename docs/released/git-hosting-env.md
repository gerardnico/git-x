% git-hosting-platform-env(1) Version Latest | Get and set the platform env
## DESCRIPTION

Get and set the platform environment

A platform is a source or a target in a transfer operation.


## USAGE

It's used and called internally by other scripts.
```bash
eval $(git-hosting-platform-env "platformName")
```

## SYNOPSIS

ENV_PREFIX=GIT_X
Create environment export statement
```bash
git-hosting-env HostingName
```
where `HostingName` is a Git Hosting such as GitHub, Gogs, ....


## ENV OUTPUT

This script return the following env:
* `GIT_PLAFORM`: the platform type
* `GIT_TOKEN`: the API token
* `ENV_PREFIX`: The env prefix (ie `GIT_X`)
