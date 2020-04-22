#!/bin/sh -l

function checkExitStatus() {
  if [ "$1" -gt "0" ]; then
    exit $1
  if
}
if [ -n "${INPUT_DOCKER_PASSWORD}" ]; then
    echo "[DOCKER_LOGIN]"
    sh -c "echo ${INPUT_DOCKER_PASSWORD} | docker login -u ${INPUT_DOCKER_USERNAME} --password-stdin ${INPUT_DOCKER_REGISTRY}"
    checkExitStatus $?
fi

if [ -n "${IMAGE_TAG}" ]; then 
    echo "IMAGE_TAG: ${IMAGE_TAG}"
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/heads\///g")
    IMAGE_TAG=$(echo ${IMAGE_TAG} | sed -e "s/refs\/tags\///g" | sed -e "s/\//-/g") 
    echo "IMAGE_TAG: ${IMAGE_TAG}"
fi 

if [ -n "${INPUT_SKAFFOLD}" ]; then
    echo "[SKAFFOLD]"
    sh -c "skaffold ${INPUT_SKAFFOLD}"
    checkExitStatus $?
fi

if [ -n "${INPUT_KUSTOMIZE}" ]; then
    echo "[KUSTOMIZE]"
    if [ -n "${INPUT_KUSTOMIZE_PATH}" ]; then 
        sh -c "cd ${INPUT_KUSTOMIZE_PATH}; kustomize ${INPUT_KUSTOMIZE}"
        checkExitStatus $?
    else
        sh -c "kustomize ${INPUT_KUSTOMIZE}"
        checkExitStatus $?
    fi
fi 
