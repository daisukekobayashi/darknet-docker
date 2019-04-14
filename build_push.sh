#!/bin/bash

for var in cpu gpu gpu-cc53 gpu-cc60 gpu-cc61 gpu-cc62 gpu-cc70 gpu-cc72 gpu-cc75 \
          cpu-cv gpu-cv gpu-cv-cc53 gpu-cv-cc60 gpu-cv-cc61 gpu-cv-cc62 gpu-cv-cc70 gpu-cv-cc72 gpu-cv-cc75
do
  DOCKER_REPO="daisukekobayashi/darknet"
  SOURCE_BRANCH="darknet_yolo_v3"
  SOURCE_COMMIT=`git ls-remote https://github.com/AlexeyAB/darknet.git darknet_yolo_v3 | awk '{ print $1 }'`
  DOCKER_TAG=$SOURCE_BRANCH-$var
  VAR=$var

  echo $DOCKER_REPO
  echo $SOURCE_BRANCH
  echo $SOURCE_COMMIT
  echo $DOCKER_TAG
  echo $VAR

if [[ "$DOCKER_TAG" == *cv* ]]; then
  if [ "$DOCKER_TAG" = "cpu-cv" ]; then
    docker build --build-arg BASE_IMAGE="ubuntu:18.04" \
      --build-arg CONFIG=$VAR \
      --build-arg ADDITIONAL_PACKAGES="libopencv-dev" \
      --build-arg SOURCE_BRANCH=$SOURCE_BRANCH \
      --build-arg SOURCE_COMMIT=$SOURCE_COMMIT \
      -t $DOCKER_REPO:$DOCKER_TAG .
  else
    docker build \
      --build-arg CONFIG=$VAR \
      --build-arg ADDITIONAL_PACKAGES="libopencv-dev" \
      --build-arg SOURCE_BRANCH=$SOURCE_BRANCH \
      --build-arg SOURCE_COMMIT=$SOURCE_COMMIT \
      -t $DOCKER_REPO:$DOCKER_TAG .
  fi
 else
  if [ "$DOCKER_TAG" = "cpu" ]; then
    docker build --build-arg BASE_IMAGE="ubuntu:18.04" \
      --build-arg CONFIG=$VAR \
      --build-arg SOURCE_BRANCH=$SOURCE_BRANCH \
      --build-arg SOURCE_COMMIT=$SOURCE_COMMIT \
      -t $DOCKER_REPO:$DOCKER_TAG .
  else
    docker build \
      --build-arg CONFIG=$VAR \
      --build-arg SOURCE_BRANCH=$SOURCE_BRANCH \
      --build-arg SOURCE_COMMIT=$SOURCE_COMMIT \
      -t $DOCKER_REPO:$DOCKER_TAG .
  fi
fi

docker push $DOCKER_REPO:$DOCKER_TAG
done

