#!/usr/bin/env bash

# Input arguments:
#   -u username to create. Must have previously been created with the create-creds.sh script
#   -n namespace to assign the user in kubernetes

while getopts u:n: option
  do
    case "${option}"
    in
    u) SUBJECT=${OPTARG};;
    n) NAMESPACE=${OPTARG};;
    esac
done

if [ -z "$SUBJECT" ]
then
      echo "Subject is a required parameter"
      echo "Usage: create-kubes-user.sh -u <user/subject> -n <namespace>"
      exit 1
fi

if [ -z "$NAMESPACE" ]
then
      echo "Namespace is a required parameter"
      echo "Usage: create-kubes-user.sh -u <user/subject> -n <namespace>"
      exit 1
fi

CERTS_HOME=~/.certs

echo "Creating kubernetes user '$SUBJECT' assigned to namespace '$NAMESPACE'"
echo "Pulling credentials from '$CERTS_HOME'"

kubectl config set-credentials $SUBJECT --client-certificate=$CERTS_HOME/$SUBJECT.crt  --client-key=$CERTS_HOME/$SUBJECT.key
kubectl config set-context $NAMESPACE-context --cluster=minikube --namespace=$NAMESPACE --user=$SUBJECT