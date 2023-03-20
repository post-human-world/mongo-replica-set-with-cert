#!/bin/bash
if [ "$1" = "" ]; then
    echo 'Please enter your hostname (CN):'
    exit 1
fi
HOST_NAME="$1"
SUBJECT="/C=GB/ST=London/L=London/O=OrganisationName/OU=OnlineServices/CN=$HOST_NAME"
openssl req -new -nodes -newkey rsa:4096 -subj "$SUBJECT" -keyout "$HOST_NAME".key -out "$HOST_NAME".csr
openssl x509 -CA mongoCA.crt -CAkey mongoCA.key -CAcreateserial -req -days 365 -in "$HOST_NAME".csr -out "$HOST_NAME".crt
rm "$HOST_NAME".csr
cat "$HOST_NAME".key "$HOST_NAME".crt > "$HOST_NAME".pem
rm "$HOST_NAME".key
rm "$HOST_NAME".crt