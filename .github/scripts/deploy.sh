#!/bin/bash

ENVIRONMENT=$1

if [ "$ENVIRONMENT" == "dev" ]; then
    DESTINATION="/usr/share/nginx/html/shoplist-dev"
elif [ "$ENVIRONMENT" == "prod" ]; then
    DESTINATION="/usr/share/nginx/html/shoplist"
else
    echo "Invalid environment"
    exit 1
fi

mkdir -p $DESTINATION
cp -r build/. $DESTINATION
