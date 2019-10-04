#!/bin/sh -l

if [ -n "${INPUT_DOCKER_PASSWORD}" ]; then
    sh -c "echo ${INPUT_DOCKER_PASSWORD} | docker login -u ${INPUT_DOCKER_USERNAME} --password-stdin ${INPUT_DOCKER_REGISTRY}"
fi

if [ -z "${INPUT_SKAFFOLD}" ]; then
    echo "skaffold args is empty. Please set with.skaffold."
fi 

sh -c "skaffold ${INPUT_SKAFFOLD}"
