#!/bin/bash

# Get the current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$CURRENT_BRANCH" == "dev" ]; then
  # Build and push the first Docker image for the dev branch
  docker build -t 7674043534/devrepo:latest .

  # Build and push the second Docker image for the dev branch
  docker build -t 7674043534/devrepo2:latest .
elif [ "$CURRENT_BRANCH" == "master" ]; then
  # Build and push the first Docker image for the master branch
  docker build -t 7674043534/prodrepo:latest .

  # Build and push the second Docker image for the master branch
  docker build -t 7674043534/prodrepo2:latest .
else
  echo "Branch not supported for deployment."
  exit 1
fi

# Check if the push was successful
if [ $? -eq 0 ]; then
  echo "Docker images pushed successfully."
  exit 0
else
  echo "Failed to push Docker images."
  exit 1
fi

