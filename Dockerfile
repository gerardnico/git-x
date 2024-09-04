
# We use the rclone DockerFile
# https://github.com/rclone/rclone/blob/master/Dockerfile

FROM rclone/rclone:1.67.0


###################################
# Packages
###################################
RUN apk update \
    # Last git (2.45.2)
    && apk add --no-cache git \
    # Bash is not installed with the alpine rclone base image \
    # coreutils is for the date
    && apk add --no-cache bash curl jq openssh coreutils

####################################
# Label
# https://docs.docker.com/reference/dockerfile/#label
# This labels are used by Github
####################################
# * connect the repo
LABEL org.opencontainers.image.source="https://github.com/gerardnico/git-backup"
# * set a description
LABEL org.opencontainers.image.description="Git backup or clone"


####################################
# Local User Configuration
####################################
# Create a host user `1000` called `me` for convenience when using WSL
# ie the UID 1000 is assigned to first non-root user
# Why? The user id created on Linux systems starts from 1000
# It permits to mount ssh keys and other asset in the home directory from a desktop
RUN addgroup -g 1000 megroup && \
    adduser -u 1000 -G megroup -D --shell /bin/bash me


####################################
# App Install
####################################
RUN mkdir "/opt/git-backup"
COPY --chmod=0755 resources/git-backup /opt/git-backup/
ENV PATH="/opt/git-backup/bin:${PATH}"
CMD [ "git-backup" ]

####################################
# Docker entrypoint
####################################
COPY --chmod=0755 resources/docker/git-backup-docker-entrypoint /usr/local/bin/
ENTRYPOINT [ "git-backup-docker-entrypoint" ]
