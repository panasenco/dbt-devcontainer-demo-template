#!/bin/bash
# Initialize demo directory if it doesn't already exist.
if [[ ! -d demo ]]; then
    meltano init demo
    cd demo
    meltano add loader target-postgres
    meltano config target-postgres set host warehouse
    meltano config target-postgres set user postgres
    meltano config target-postgres set password postgres
    meltano config target-postgres set dbname postgres
    meltano add transformer dbt-postgres
    meltano config dbt-postgres set host warehouse
    meltano config dbt-postgres set port 5432
    meltano config dbt-postgres set user postgres
    meltano config dbt-postgres set password postgres
    meltano config dbt-postgres set dbname postgres
    meltano config dbt-postgres set schema analytics
    meltano invoke dbt-postgres:docs-generate
fi