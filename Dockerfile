
# We use the rclone DockerFile
# https://github.com/rclone/rclone/blob/master/Dockerfile

FROM rclone/rclone:1.67.0


###################################
# Packages
###################################
RUN apk add --no-cache git \
    # Bash is not installed with the alpine rclone base image
    && apk add --no-cache bash curl jq

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
# It permits to mount ssh keys and other asset in the home directory
#RUN addgroup -G 1000 megroup && \
#    adduser -u 1000 -G 1000 --shell /bin/bash me


####################################
# App Install
####################################
RUN mkdir "/opt/git-backup"
COPY resources/git-backup /opt/git-backup
RUN chmod 0755 /opt/git-backup/bin/*
ENV PATH="/opt/git-backup/bin:${PATH}"


ENTRYPOINT []
CMD ["git-backup"]
