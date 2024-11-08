
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
    && apk add --no-cache bash curl jq openssh coreutils sed

####################################
# Label
# https://docs.docker.com/reference/dockerfile/#label
# This labels are used by Github
####################################
# * connect the repo
LABEL org.opencontainers.image.source="https://github.com/gerardnico/git-x"
# * set a description
LABEL org.opencontainers.image.description="Git X (Git Command for everyday use against multiple repo)"


####################################
# Local User Configuration
####################################
# Create a host user `1000` called `me` for convenience when using WSL
# ie the UID 1000 is assigned to first non-root user
# Why? The user id created on Linux systems starts from 1000
# It permits to mount ssh keys and other asset in the home directory from a desktop
RUN addgroup -g 1000 megroup && \
    adduser -u 1000 -G megroup -D --shell /bin/bash me


# Download and extract GitHub repository archive, then copy 'bin' directory contents
# Branch Download https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives
#ADD https://github.com/gerardnico/bash-lib/archive/refs/heads/main.tar.gz /tmp/bashlib.tar.gz
#RUN mkdir -p "/opt/git-x/bin"
#COPY --chmod=0755 bin /opt/git-x/bin
#ENV PATH="/opt/git-x/bin:${PATH}"
#CMD [ "git" ]
#
#RUN curl -L https://github.com/<username>/<repository>/archive/refs/heads/<branch>.tar.gz | \
#    tar -xz --strip-components=2 "<repository>-<branch>/bin/" && \
#    mv bin/* /opt/myapp/ && rm -rf bin \

####################################
# BashLib Install
####################################
RUN mkdir -p "/opt/bash-lib/lib"
COPY bash-lib/lib /opt/bash-lib/lib
ENV BASHLIB_LIBRARY_PATH="/opt/bash-lib/lib"

####################################
# App Install
####################################
RUN mkdir -p "/opt/git-x/bin"
COPY --chmod=0755 git-x/bin /opt/git-x/bin
ENV PATH="/opt/git-x/bin:${PATH}"
CMD [ "git" ]


####################################
# Docker entrypoint
####################################
COPY --chmod=0755 git-x/resources/docker/git-x-docker-entrypoint /usr/local/bin/
ENTRYPOINT [ "git-x-docker-entrypoint" ]
