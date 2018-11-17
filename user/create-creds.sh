#!/usr/bin/env bash

# Input arguments:
#   -u username/subject certificate
#   -o organization for the certificate
# Output:
#   credentials will be written to ~/.certs

while getopts u:o: option
  do
    case "${option}"
    in
    u) SUBJECT=${OPTARG};;
    o) ORG=${OPTARG};;
    esac
done

if [ -z "$SUBJECT" ]
then
      echo "Subject is a required parameter"
      echo "Usage: create-creds.sh -u <user/subject> -o <organization>"
      exit 1
fi

if [ -z "$ORG" ]
then
      echo "Organization is a required parameter"
      echo "Usage: create-creds.sh -u <user/subject> -o <organization>"
      exit 1
fi

echo "Creating credentials for user '$SUBJECT' in organization '$ORG'"

OUT_DIR=~/.certs/
mkdir $OUT_DIR >& /dev/null # swallow error if directory already exists

echo "Writing credentials to '$OUT_DIR'"

CA_LOCATION=~/.minikube/

echo "Using minikube CA found at '$CA_LOCATION'"

openssl genrsa -out $OUT_DIR/$SUBJECT.key 2048
openssl req -new -key $OUT_DIR/$SUBJECT.key -out $OUT_DIR/$SUBJECT.csr -subj "/CN=$SUBJECT/O=$ORG"
openssl x509 -req -in $OUT_DIR/$SUBJECT.csr -CA $CA_LOCATION/ca.crt -CAkey $CA_LOCATION/ca.key -CAcreateserial -out $OUT_DIR/$SUBJECT.crt -days 500