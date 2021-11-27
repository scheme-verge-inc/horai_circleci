#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
PROJECT_ROOT=$SCRIPT_DIR/../..
IMAGE_DIR=$PROJECT_ROOT/.circleci/images

cd $IMAGE_DIR

docker build --no-cache -t horai/api-circleci-image . -f Dockerfile.nodejs
docker build --no-cache -t horai/elasticsearch . -f Dockerfile.elasticsearch
docker build --no-cache -t horai/python-circleci-image . -f Dockerfile.python

docker push horai/api-circleci-image:latest
docker push horai/elasticsearch:latest
docker push horai/python-circleci-image:latest