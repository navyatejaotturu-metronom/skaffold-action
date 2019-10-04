#!/bin/sh -l

if [ -n "${INPUT_DOCKER_PASSWORD}" ]; then
    sh -c "docker login -u $INPUT_DOCKER_USERNAME -p $INPUT_DOCKER_PASSWORD $INPUT_REGISTRY"
fi

if [ -z "${INPUT_SKAFFOLD}" ]; then
    echo "skaffold args is empty. Please set with.skaffold."
fi 

sh -c "skaffold ${INPUT_SKAFFOLD}"
