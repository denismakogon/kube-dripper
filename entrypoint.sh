#!/usr/bin/env bash

# shellcheck disable=SC2154
# shellcheck disable=SC2086
python DRipper.py -s ${ripper_attack_host} -p ${ripper_attack_port} -t ${thread_count:-"100"} -m ${attack_method:-"http"}
