#!/bin/sh -l

if [ -n "${INPUT_DOCKER_PASSWORD}" ]; then
    echo "[DOCKER_LOGIN]"
    sh -c "echo ${INPUT_DOCKER_PASSWORD} | docker login -u ${INPUT_DOCKER_USERNAME} --password-stdin ${INPUT_DOCKER_REGISTRY}"
fi

if [ -z "${INPUT_SKAFFOLD}" ]; then
    echo "skaffold args is empty. Please set with.skaffold."
fi 

if [ -n "${IMAGE_TAG}" ]; then 
    echo "GITHUB_REF: ${GITHUB_REF}"
    echo "IMAGE_TAG: ${IMAGE_TAG}"
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/heads\///g")
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/tags\///g" | sed -e "s/\//-/g") 
    echo "IMAGE_TAG: ${IMAGE_TAG}"
fi 

echo "[SKAFFOLD]"
sh -c "skaffold ${INPUT_SKAFFOLD}"

if [ -n "${INPUT_KUSTOMIZE}" ]; then
    echo "[KUSTOMIZE]"
    sh -c "kustomize ${INPUT_KUSTOMIZE}"
fi 
