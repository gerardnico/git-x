# Git Service Backup from GitHub to Rclone 

## About

This `git service backup` command back up Git repositories:
* from `GitHub`
* to a [Rclone destination](https://rclone.org/overview/)
* as a [Git bundle](https://git-scm.com/book/en/v2/Git-Tools-Bundling)



## Example

### S3

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
  -e GITBKP_GITHUB_TOKEN= \
  -e GITBKP_S3_PLATFORM=rclone \
  -e GITBKP_S3_RCLONE_BASE_PATH=git-backup \
  -e RCLONE_CONFIG_S3_TYPE=s3 \
  -e RCLONE_CONFIG_S3_PROVIDER=IDrive \
  -e RCLONE_CONFIG_S3_ENDPOINT=h0k0.ca.idrivee2-22.com \
  -e RCLONE_CONFIG_S3_SECRET_ACCESS_KEY= \
  -e RCLONE_CONFIG_S3_ACCESS_KEY_ID= \
  -e RCLONE_CONFIG_S3_NO_CHECK_BUCKET=true \
  -e RCLONE_CONFIG_S3_SERVER_SIDE_ENCRYPTION=aws:kms \
  ghcr.io/gerardnico/git-x:latest \
  git service backup github s3 --filter-exclude-pattern=site-com-datacadamia
```

### SFTP Bunny

To back up your repositories:
* from github
* to Bunny with [Rclone SFTP](https://rclone.org/sftp/)
* excluding the repo `site-com-datacadamia`
  you would execute:
```bash
docker run \
  --name git-backup \
  --rm \
  --user 1000:1000 \
  -v ~/.ssh:/home/me/.ssh \
  -e GITBKP_GITHUB_TOKEN= \
  -e GITBKP_BUNNY_PLATFORM=rclone \
  -e RCLONE_INPLACE=1 \
  -e RCLONE_SIZE_ONLY=1 \
  -e RCLONE_CONFIG_BUNNY_TYPE=sftp \
  -e RCLONE_CONFIG_BUNNY_HOST=storage.bunnycdn.com \
  -e RCLONE_CONFIG_BUNNY_ENDPOINT=h0k0.ca.idrivee2-22.com \
  -e RCLONE_CONFIG_BUNNY_USER=git-backup \
  -e RCLONE_CONFIG_BUNNY_PASS= \
  ghcr.io/gerardnico/git-x:latest \
  git service backup github bunny --filter-exclude-pattern=site-com-datacadamia
```

Note that:
* `RCLONE_INPLACE=1` is needed because [Bunny does not support renaming](https://support.bunny.net/hc/en-us/articles/360020400891-I-am-unable-to-rename-files-using-FTP)
  Leading to error such as `partial file rename failed: Move Rename failed: sftp: "Internal server error." (SSH_FX_FAILURE)`
* `RCLONE_SIZE_ONLY=1` is needed because Bunny does not support modification time update.


## Example Explanation

The command executed is:
```
git-service backup github s3 --filter-exclude-pattern=site-com-datacadamia
```
where:
  * `backup` is the command
  * `github` is the service defined by the following `GITBKP_SERVICE_NAME_xxx` envs)
```bash
GITBKP_GITHUB_PLATFORM=github # platform type
GITBKP_GITHUB_TOKEN= # API Token 
```
  * `s3` is the target defined by the following `GITBKP_SERVICE_NAME_xxx` envs
```bash
GITBKP_S3_PLATFORM=rclone # rclone 
GITBKP_S3_RCLONE_REMOTE_NAME=s3 # optional remote name, by default, the target registry name (only characters and _ as this an env), 
GITBKP_S3_RCLONE_BASE_PATH=git-backup # the base path (in our s3 case, the bucket name)
```
  * `--filter-exclude-pattern=xxx` is a regexp pattern that if the expression matches the full name repository (`workspace/name`) will exclude it from backup


The rclone remote name is configured via [the native rclone environment variable](https://rclone.org/docs/#environment-variables). 
ie `RCLONE_CONFIG_REMOTE_NAME_XXX` 
```bash
# in our case the GIT_BACKUP remote name was defined via the env `GITBKP_S3_RCLONE_REMOTE_NAME=git_backup`
RCLONE_CONFIG_S3_TYPE=s3
RCLONE_CONFIG_S3_PROVIDER=IDrive
RCLONE_CONFIG_S3_ENDPOINT=h0k0.ca.idrivee2-22.com
RCLONE_CONFIG_S3_SECRET_ACCESS_KEY=
RCLONE_CONFIG_S3_ACCESS_KEY_ID=
RCLONE_CONFIG_S3_NO_CHECK_BUCKET=true
RCLONE_CONFIG_S3_SERVER_SIDE_ENCRYPTION=aws:kms
```

  * The env below mount your SSH directory for a GitHub authentication
```bash
--user 1000:1000 \
-v ~/.ssh:/home/me/.ssh
```

# Prerequisites

* SSH Authentication:
  * An SSH private key in your `~/.ssh` directory. ie [Generate a key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  * With [the corresponding public key added to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
* [A GitHub API Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) known as Personal Access Token or PAT 
  * with the scope `repo` for public and private repo 
* A [Rclone destination](https://rclone.org/overview/)
* The [dependencies](#)
# How to restore

A [bundle](https://git-scm.com/book/en/v2/Git-Tools-Bundling) can be cloned.
```bash
git clone /path/to/repo.bundle
# or
git clone https://host/path/to/repo.bundle
```


# Backup processing explained

The backup processing implemented in the `backup` function of the [git-backup script](../../bin/git-hosting) is:
* Store the start time and get the last backup time
* Get the repos via API and loop over them
  * Skip the backup if: 
    * the last pushed time of the repo is earlier than the last backup (and if a backup exist)
    * the repository is empty
    * the repository is a fork
  * Otherwise, backup with the following commands:
```bash
# git clone a mirror repository locally
git clone --mirror  
# create a bundle
git bundle create  --all
# upload the bundle to `workspace/repository_name`
rclone moveto   --progress
```
  * Repeat for another repo
* Delete the start time
* Write the last time with the start time
* End


# Tip: How to sync between 2 git registries

The [Gickup application](https://cooperspencer.github.io/gickup-documentation/) is more suited for that.


# How to contribute

See [dev](../contrib/git-service-backup-dev)


# Why do you choose SSH over Personal Access Token for Github

That's the easiest way to login.

Note that AskPass or a helper may be used to pass the token
as stated in the [doc](https://git-scm.com/docs/gitcredentials), but it's not yet implemented

The `Personal Access Token (PAT)` should not be used in a Basic Auth URL as this URL is stored
```
https://user:/github.com/parent/repo
```


# Kubernetes

In the `command` property of a container, you should use the [entrypoint](../../resources/docker/git-multi-docker-entrypoint)
to create the `host_known` file with GitHub SSH keys and avoid the error: `Host key verification failed`

Example:
```yaml
command: [ "git-multi-docker-entrypoint" ]
args: [ "git-backup", "backup", "github", "s3", "--filter-exclude-pattern=site-com-datacadamia", "--restart" ]
```

# Dependencies

We use the following dependencies are
* Date from coreutils mandatory
* git
* openssh
* curl
