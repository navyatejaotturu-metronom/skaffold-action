#!/bin/sh -l

if [ -n "${INPUT_DOCKER_PASSWORD}" ]; then
    sh -c "echo ${INPUT_DOCKER_PASSWORD} | docker login -u ${INPUT_DOCKER_USERNAME} --password-stdin ${INPUT_DOCKER_REGISTRY}"
fi

if [ -z "${INPUT_SKAFFOLD}" ]; then
    echo "skaffold args is empty. Please set with.skaffold."
fi 

if [ -n "${IMAGE_TAG}" ]; then 
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/heads\///g")
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/tags\///g" | sed -e "s/\//-/g") 
fi 

sh -c "skaffold ${INPUT_SKAFFOLD}"
