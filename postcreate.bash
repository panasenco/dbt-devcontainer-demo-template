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
fi