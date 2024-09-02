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

## Github

```bash
docker run \
  --name git-backup \
  --rm \
  -it \
  -v ./resources/git-backup:/opt/git-backup \
  -e GIT_GITHUB_PLATFORM=github \
  -e GIT_GITHUB_TOKEN=$GITHUB_TOKEN \
  ghcr.io/gerardnico/git-backup:latest \
  /bin/bash
```
