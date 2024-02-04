#!/bin/bash
echo "*********************"
echo "** Pushing image **"
echo "*********************"

IMAGE=hadesgod/learn-jenkins-maven:$BUILD_TAG

echo "*********************"
echo "** Docker login **"
echo "*********************"
docker login -u hadesgod -p $PASS

echo "*********************"
echo "** push Docker image: $IMAGE **"
echo "*********************"
docker push $IMAGE