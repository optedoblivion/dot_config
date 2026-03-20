#!/bin/bash

ls *.yaml | while read config_yaml; do
    echo "${config_yaml}" | cut -d '.' -f 1
    toml_name="$(echo ${config_yaml} | cut -d '.' -f 1).toml"
    yaml2toml "${config_yaml}" "${toml_name}"
done
