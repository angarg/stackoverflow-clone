#!/bin/sh

env
until nc -z $DATABASE_HOST $DATABASE_PORT; do
    echo "waiting for mongo"
    sleep 5
done
