# How to dev



## Gogs

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
  -e GIT_GITHUB_PLATFORM=github \
  -e GIT_GITHUB_TOKEN=$GITHUB_TOKEN \
  -e GIT_S3_PLATFORM=rclone \
  -e GIT_S3_RCLONE_TYPE=s3 \
  -e GIT_S3_RCLONE_PROVIDER=IDrive \
  -e GIT_S3_RCLONE_ENDPOINT=h0k0.ca.idrivee2-22.com \
  -e GIT_S3_RCLONE_SECRET_KEY=$GIT_BACKUP_SECRET_KEY \
  -e GIT_S3_RCLONE_ACCESS_KEY=$GIT_BACKUP_ACCESS_KEY \
  -e GIT_S3_RCLONE_BUCKET_NAME=git-backup \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  ghcr.io/gerardnico/git-backup:latest \
  /bin/bash
```
