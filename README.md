# Git Backup from GitHub to Rclone 

## About

This [application](resources/git-backup/bin/git-backup) back up Git repositories:
* from GitHub
* to a [Rclone destination](https://rclone.org/overview/)
* as a [Git bundle](https://git-scm.com/book/en/v2/Git-Tools-Bundling)



## Example

To back up your repositories:
* from github 
* to s3 
* excluding the repo `site-com-datacadamia`
you would execute:
```bash
docker run \
  --name git-backup \
  --rm \
  --user 1000:1000 \
  -v ~/.ssh:/home/me/.ssh \
  -e GITBKP_GITHUB_PLATFORM=github \
  -e GITBKP_GITHUB_TOKEN=$GITHUB_TOKEN \
  -e GITBKP_S3_PLATFORM=rclone \
  -e GITBKP_S3_RCLONE_REMOTE_NAME=git_backup \
  -e GITBKP_S3_RCLONE_BASE_PATH=git-backup \
  -e RCLONE_CONFIG_GIT_BACKUP_TYPE=s3 \
  -e RCLONE_CONFIG_GIT_BACKUP_PROVIDER=IDrive \
  -e RCLONE_CONFIG_GIT_BACKUP_ENDPOINT=h0k0.ca.idrivee2-22.com \
  -e RCLONE_CONFIG_GIT_BACKUP_SECRET_ACCESS_KEY=$GIT_BACKUP_SECRET_KEY \
  -e RCLONE_CONFIG_GIT_BACKUP_ACCESS_KEY_ID=$GIT_BACKUP_ACCESS_KEY \
  -e RCLONE_CONFIG_GIT_BACKUP_NO_CHECK_BUCKET=true \
  -e RCLONE_CONFIG_GIT_BACKUP_SERVER_SIDE_ENCRYPTION=aws:kms \
  ghcr.io/gerardnico/git-backup:latest \
  git-backup backup github s3 --filter-exclude-pattern=site-com-datacadamia
```

## Example Explanation

The command executed is:
```
git-backup backup github s3 --filter-exclude-pattern=site-com-datacadamia
```
where:
  * `backup` is the command
  * `github` is the source registry defined by the following `GITBKP_REGSITRY_NAME_xxx` envs
```bash
GITBKP_GITHUB_PLATFORM=github # platform type
GITBKP_GITHUB_TOKEN=$GITHUB_TOKEN # API Token 
```
  * `s3` is the target registry defined by the following `GITBKP_REGISTRY_NAME_xxx` envs
```bash
GITBKP_S3_PLATFORM=rclone # rclone 
GITBKP_S3_RCLONE_REMOTE_NAME=git_backup # remote name (only characters and _ as this an env)
GITBKP_S3_RCLONE_BASE_PATH=git-backup # the base path (in our s3 case, the bucket name)
```
  * `--filter-exclude-pattern=xxx` is a regexp pattern that if the expression matches the full name repository (`workspace/name`) will exclude it from backup


The rclone remote name is configured via [the native rclone environment variable](https://rclone.org/docs/#environment-variables). 
ie `RCLONE_CONFIG_REMOTE_NAME_XXX` 
```bash
# in our case the GIT_BACKUP remote name was defined via the env `GITBKP_S3_RCLONE_REMOTE_NAME=git_backup`
RCLONE_CONFIG_GIT_BACKUP_TYPE=s3 \
RCLONE_CONFIG_GIT_BACKUP_PROVIDER=IDrive \
RCLONE_CONFIG_GIT_BACKUP_ENDPOINT=h0k0.ca.idrivee2-22.com \
RCLONE_CONFIG_GIT_BACKUP_SECRET_ACCESS_KEY=$GIT_BACKUP_SECRET_KEY \
RCLONE_CONFIG_GIT_BACKUP_ACCESS_KEY_ID=$GIT_BACKUP_ACCESS_KEY \
RCLONE_CONFIG_GIT_BACKUP_NO_CHECK_BUCKET=true \
RCLONE_CONFIG_GIT_BACKUP_SERVER_SIDE_ENCRYPTION=aws:kms \
```

  * The env below mount your SSH directory for a GitHub authentication
```bash
--user 1000:1000 \
-v ~/.ssh:/home/me/.ssh
```

## Prerequisites

* SSH Authentication:
  * An SSH private key in your `~/.ssh` directory. ie [Generate a key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  * With [the corresponding public key added to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
* [A GitHub API Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) known as Personal Access Token or PAT 
  * with the scope `repo` for public and private repo 
* A [Rclone destination](https://rclone.org/overview/)

## How to restore

A [bundle](https://git-scm.com/book/en/v2/Git-Tools-Bundling) can be cloned.
```bash
git clone /path/to/repo.bundle
# or
git clone https://host/path/to/repo.bundle
```


## Backup processing explained

The backup processing is:
* Store the start time and get the last backup time
* Get the repos via API and loop over them
  * Skip the backup if: 
    * the last pushed time of the repo is earlier than the last backup (and if a backup exist)
    * the repository is empty
    * the repository is a fork
  * Otherwise:
    * git clone a mirror repository locally
    * create a bundle
    * upload the bundle to `workspace/repository_name`
    * delete the clone
  * Repeat for another repo
* Delete the start time
* Write the last time with the start time
* End


## Tip: How to sync between 2 git registries

The [Gickup application](https://cooperspencer.github.io/gickup-documentation/) is more suited for that.


## How to contribute

See [dev](doc/dev.md)


## Why do you choose SSH over Personal Access Token for Github

That's the easiest way to login.

Note that AskPass or a helper may be used to pass the token
as stated in the [doc](https://git-scm.com/docs/gitcredentials)
but it's not yet implemented

The `Personal Access Token` should not be used in a Basic Auth URL as this URL is stored
```
https://user:$TOKEN/github.com/parent/repo
```


## Kubernetes

In the `command` property of a container, you should use the [entrypoint](resources/docker/git-backup-docker-entrypoint)
to create the `host_known` file with GitHub SSH keys and avoid the error: `Host key verification failed`

Example:
```yaml
command: [ "git-backup-docker-entrypoint" ]
args: [ "git-backup", "backup", "github", "s3", "--filter-exclude-pattern=site-com-datacadamia", "--restart" ]
```