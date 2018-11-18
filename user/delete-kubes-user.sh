#!/usr/bin/env bash

# Input arguments:
#   -u username to remove from k8s.
#   -n namespace used when the k8s context was created

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
      echo "Usage: delete-kubes-user.sh -u <user/subject> -n <namespace>"
      exit 1
fi

if [ -z "$NAMESPACE" ]
then
      echo "Namespace is a required parameter"
      echo "Usage: delete-kubes-user.sh -u <user/subject> -n <namespace>"
      exit 1
fi

CERTS_HOME=~/.certs

echo "Removing kubernetes user '$SUBJECT' assigned to context '$NAMESPACE-context'"

kubectl config unset users.$SUBJECT
kubectl config unset contexts.$NAMESPACE-context
