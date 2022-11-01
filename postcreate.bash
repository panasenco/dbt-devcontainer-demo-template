#!/bin/bash
# Run only if directory provided in first parameter does not exist.
if [[ ! -d demo ]]; then
    meltano init demo
    cd demo
fi