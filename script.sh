#!/bin/bash

# Variables
BUCKET_NAME="your-bucket-name"
ACL_ACTION=$1        # 'enable' or 'disable'

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

# Function to change ownership
change_ownership() {
    echo "Changing ownership for bucket: $BUCKET_NAME to $1"
    aws s3api put-bucket-ownership-controls --bucket "$BUCKET_NAME" --ownership-controls \
        "Rules=[{ObjectOwnership=$1}]"
}

# Main execution
if [[ "$ACL_ACTION" == "enable" ]]; then
    enable_acl
    change_ownership ObjectWriter
elif [[ "$ACL_ACTION" == "disable" ]]; then
    disable_acl
    change_ownership BucketOwnerEnforced
else
    echo "Invalid ACL action. Use 'enable' or 'disable'."
    exit 1
fi
