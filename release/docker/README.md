# Docker

## How to develop?

```bash
# create the dockerfile from the template
JRELEASER_PROJECT_VERSION="0.1.0" jreleaser prepare --debug -p=docker
# put in the local registry
JRELEASER_PROJECT_VERSION="0.1.0" jreleaser package --debug -p=docker
```

Release is done with the [release script](../../release/release)
