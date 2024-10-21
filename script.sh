#!/bin/bash

# Variables
BUCKET_NAME="kbank-eban-prod"
ACL_STATE=$1 # Pass 'enable' or 'disable' as a parameter

# Function to enable ACL
enable_acl() {
    echo "Enabling ACL for bucket: $BUCKET_NAME"
    aws s3api put-bucket-acl --bucket "$BUCKET_NAME" --acl public-read
}

# Function to disable ACL
disable_acl() {
    echo "Disabling ACL for bucket: $BUCKET_NAME"
    aws s3api put-bucket-acl --bucket "$BUCKET_NAME" --acl private
}

# Check if the correct parameter is passed
if [ "$ACL_STATE" == "enable" ]; then
    enable_acl
elif [ "$ACL_STATE" == "disable" ]; then
    disable_acl
else
    echo "Usage: $0 <enable|disable>"
    exit 1
fi
