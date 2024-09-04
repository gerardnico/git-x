# How to dev




## Github to s3 via Rclone

* The token is needed for the API
* The ssh key is needed for Git

```bash
cd ~/code/git-backup
docker run \
  --name git-backup \
  --rm \
  -it \
  --user 1000:1000 \
  -v ./resources/git-backup:/opt/git-backup \
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
  /bin/bash
```
* Modify the script
* Run it
```bash
git-backup ....
```



## Algo

### Backup via Rclone Sync

Algo:
* Start a backup script
* Is there a start time file, if yes, error.
* Write the start time into a file at the remote location
* Get the last backup time from the last backup time file
* Get the repos via API
* Loop over the repos, if the last pushed time of the repo is bigger than the last backup, run the below commands
```bash
export RCLONE_LOG_LEVEL=INFO
cd ~
mkdir -p ~/gerardnico/shell
git clone --mirror git@github.com:gerardnico/shell.git ~/gerardnico/shell
# https://git-scm.com/docs/gitformat-bundle
# A bundle is an archive file that a user can use with the git clone command to create a local repository.
# The bundle contains your source code, as well as the change history for the commits and branches that you reference during the bundle creation step 
# then bundle results in only one file (no need to archive)
# The bundle command package up everything that would normally be pushed over the wire with a git push
# -c 'pack.threads=1' - forcing git to be single threaded makes the output deterministic.
git -C ~/gerardnico/shell -c 'pack.threads=1' bundle create ~/gerardnico/gerardnico.shell.bundle --all
# The md5 sum stays the same
md5sum ~/gerardnico/gerardnico.shell.bundle # ie 44e9133160acee494bc7bdccd30441dd
# rclone syncs in one direction only, from source to dest
# It effectively downloads the file and uploads it again, check with --interactive
# --no-update-time because the clone messed them up
# --checksum Check for changes with size & checksum, normally rclone will look at modification time and size of files to see if they are equal. 
# --backup-dir=DIR: any files which would have been overwritten or deleted are moved in their original hierarchy into this directory
# Flags: https://rclone.org/flags/
rclone sync --checksum --no-update-modtime ~/gerardnico/shell git-backup:git-backup/gerardnico/shell
# Tar.gz get the atomicity, no problem of file discrepancy.
# We could also tar zip the file, I don't know what is faster (sync or tar zip)
# when using rcat, rclone does not know the file size and you must set the correct value.
tar -zcvf - / --exclude-from=/tmp/exc | rclone rcat git-backup:git-backup/data_date "+%Y-%m-%d_%H:%M:%S".tar.gz -v
rm -rf ~/gerardnico/shell
```
* At completion, overwrite the last backup time with the start backup time 



## Gogs

For now only repo listing.

```bash
docker run \
  --name git-backup \
  --rm \
  -it \
  -v ./resources/git-backup:/opt/git-backup \
  -e GIT_GOGS_PLATFORM=gogs \
  -e GIT_GOGS_DOMAIN=gogs.bytle.net \
  -e GIT_GOGS_TOKEN=$GOGS_TOKEN \
  ghcr.io/gerardnico/git-backup:latest \
  /bin/bash
```

## Note
### Mount

We tried to mount, but it was not really a success when using with git directly.

If you want to test it again, for a rclone mount with fuse, you need to add the following options
to the docker run.
```bash
docker run \
  --cap-add SYS_ADMIN \
  --device /dev/fuse
```

### Git Timestamp

Git does not record timestamp for the files, since it is a Distributed VCS
(meaning the time on your computer can be different from mine: there is no "central" notion of time and date)