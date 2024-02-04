#!/bin/bash

echo "*********************"
echo "** Copying **"
echo "*********************"

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

# remote_key is in jenkins container
scp -i /tmp/remote_key /tmp/.auth remote_user@remote_host:/tmp/.auth
scp -i /tmp/remote_key ./jenkins/deploy/publish.sh remote_user@remote_host:/tmp/publish.sh
ssh -i /tmp/remote_key "/tmp/publish.sh" # command to execute /tmp/publish.sh