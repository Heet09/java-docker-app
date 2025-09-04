#!/bin/bash
LOGFILE="/tmp/userdata.log"
exec > >(tee -a $LOGFILE) 2>&1

echo "==== Starting EC2 userdata script ===="

# Update OS and install Docker + AWS CLI
yum update -y
yum install -y docker aws-cli
systemctl enable docker
systemctl start docker
sleep 10   # ensure Docker is fully ready

# Variables
AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="815254799750"   # Replace with your AWS account ID
ECR_REPO_NAME="java-app"
CONTAINER_NAME="spring-boot-app"
HOST_PORT=8080
CONTAINER_PORT=8080

# ECR Login
echo "Logging in to ECR..."
if aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com; then
    echo "ECR login successful"
else
    echo "ECR login failed!" >&2
    exit 1
fi

# Pull the latest app image
echo "Pulling Docker image..."
docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:latest

# Stop and remove old container if exists
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run the container
docker run -d --name $CONTAINER_NAME -p $HOST_PORT:$CONTAINER_PORT $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:latest

# Verify container
echo "Current containers:"
docker ps

echo "==== Userdata script finished ===="

