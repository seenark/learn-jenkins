#!/bin/bash

# Copy the new jar to the build directory
cp -f java-app/target/*.jar jenkins/build/


echo "*********************"
echo "** Building Docker image **"
echo "*********************"
cd jenkins/build/ && docker compose -f docker-compose.yml build --no-cache