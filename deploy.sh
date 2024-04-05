#!/bin/bash

# Get the current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$CURRENT_BRANCH" == "dev" ]; then
  # Push the Docker image to the dev repository
  docker push 7674043534/devrepo
elif [ "$CURRENT_BRANCH" == "master" ]; then
  # Push the Docker image to the prod repository
  docker push 7674043534/prodrepo
else
  echo "Branch not supported for deployment."
  exit 1
fi

# Check if the push was successful
if [ $? -eq 0 ]; then
  echo "Docker image pushed successfully."
  exit 0
else
  echo "Failed to push Docker image."
  exit 1
fi
