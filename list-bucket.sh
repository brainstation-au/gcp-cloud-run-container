#!/usr/bin/env bash

AccessToken=$(gcloud auth print-identity-token)
Response=$(aws sts assume-role-with-web-identity --role-arn "${AWS_ROLE_ARN}" --role-session "cloud-guild" --web-identity-token "$AccessToken")
export AWS_ACCESS_KEY_ID=$(echo $Response | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $Response | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $Response | jq -r .Credentials.SessionToken)

aws s3 ls
