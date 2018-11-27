#!/bin/bash

HELP='# Dockerized Standard Actions
* `docker.sh --create` -- create docker containers for core-thirdparty
* `docker.sh --shell` -- drop to an interactive shell in the default container'

DOCKER_IMAGE_NAGE="chef-workstation"

set -e

while [[ "$#" > 0 ]]
do
    cmd="$1"
    shift
    case $cmd in
        --help)
            printf '%s' "$HELP";
            exit 0
            ;;
        #
        # Create Docker Images
        #
        # - The core-liutils image builds from core-thirdparty
        --create)
            echo "Rebuilding $DOCKER_IMAGE_NAME image"
            docker build -t $DOCKER_IMAGE_NAGE -f docker/Dockerfile .
            ;;
        #
        # Running container with mounted working directory.
        #
        #
        --shell)
            echo "Running $DOCKER_IMAGE_NAME container image"
            docker run -it -v "`pwd`:/root/chef-repo" chef-workstation /bin/bash
            exit 0
            ;;
        *)
            echo "Unknown command $1"
            exit 1
            ;;
    esac;
done

exit 0
