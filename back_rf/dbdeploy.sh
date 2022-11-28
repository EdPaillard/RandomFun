#!/bin/bash

pg_hostname=back_rf_dev
export PGPASSWORD=postgres

while ! pg_isready -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER
do
    echo "$(date) - Waiting for postgres to deploy..."
    sleep 5
done

if [[ -z `psql -h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER -Atqc "\\list $POSTGRES_DB"` ]]; then
    echo "Database already exists, cleaning things..."
    mix ecto.reset
    echo "Creating $POSTGRES_HOST Database"
    mix ecto.create
    echo "Database creating, executing migration"
    mix ecto.migrate
else
    echo "Creation of the $pg_hostname database"
    mix ecto.create
    echo "Database successfully created, processing migration..."
    mix ecto.migrate
fi

mix phx.server