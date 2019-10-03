#!/bin/sh -l

if [ -z "${INPUT_SKAFFOLD}" ]; then
    echo "skaffold args is empty. Please set with.skaffold."
fi 

sh -c "skaffold ${INPUT_SKAFFOLD}"
