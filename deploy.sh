#!/bin/bash

# usage: ./deploy.sh staging f0478bd7c2f584b41a49405c91a439ce9d944657

BRANCH=$1
# SHA1=$2
SHA1=$(tar -cf - . | md5sum | awk '{ print $1 }')

AWS_ACCOUNT_ID=168745904620
NAME=yet-another-admin-system
REGION=us-east-1
# EB_BUCKET=aws-s3-bucket-to-hold-application-versions

VERSION=$BRANCH-$SHA1
ZIP=$VERSION.zip

aws configure set default.region $REGION

# Authenticate against our Docker registry
eval $(aws ecr get-login)

# Build and push the image
docker build -t $NAME:$VERSION .
docker tag $NAME:$VERSION $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$NAME:$VERSION
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$NAME:$VERSION
