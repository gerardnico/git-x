# We use the rclone DockerFile
# https://github.com/rclone/rclone/blob/master/Dockerfile
FROM rclone/rclone:1.67.0

####################################
# Label
# https://docs.docker.com/reference/dockerfile/#label
# These labels are used by Github to connect the repo
####################################
{{#dockerLabels}}
LABEL {{.}}
{{/dockerLabels}}

{{#dockerPreCommands}}
{{.}}
{{/dockerPreCommands}}

# Setup
RUN apk update && \
    # Last git (2.45.2)
    apk add --no-cache git && \
    # Bash is not installed with the alpine rclone base image
    # coreutils is for the date
    apk add --no-cache bash curl jq openssh coreutils sed unzip && \
    ####################################
    # Local User Configuration
    ####################################
    # Create a host user `1000` called `me` for convenience when using WSL
    # ie the UID 1000 is assigned to first non-root user
    # Why? The user id created on Linux systems starts from 1000
    # It permits to mount ssh keys and other asset in the home directory from a desktop
    addgroup -g 1000 megroup && \
    adduser -u 1000 -G megroup -D --shell /bin/bash me

# Download and install remotely
# RUN curl -Ls "{{distributionUrl}}" --output {{distributionArtifactFile}} && \
#    unzip {{distributionArtifactFile}} && \
#    rm {{distributionArtifactFile}} && \
#    rm -rf {{distributionArtifactRootEntryName}}/man1 && \
#    chmod +x {{distributionArtifactRootEntryName}}/bin/*

# Download and install locally
WORKDIR /
COPY assembly/ /
RUN unzip {{distributionArtifactFile}} && \
    rm {{distributionArtifactFile}} && \
    rm -rf {{distributionArtifactRootEntryName}}/man1 && \
    chmod +x {{distributionArtifactRootEntryName}}/bin/*
WORKDIR /data

{{#dockerPostCommands}}
{{.}}
{{/dockerPostCommands}}

# Path
ENV PATH="${PATH}:/{{distributionArtifactRootEntryName}}/bin:/{{distributionArtifactRootEntryName}}/lib"

# Entrypoint
COPY --chmod=0755 git-x-docker-entrypoint /usr/local/bin/
ENTRYPOINT [ "git-x-docker-entrypoint" ]

# Command
{{#dockerCmd}}
CMD {{dockerCmd}}
{{/dockerCmd}}
