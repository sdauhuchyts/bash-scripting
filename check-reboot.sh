#!/usr/bin/env bash

[[ "$(uname -r)" == "$(readlink /boot/vmlinuz | sed 's/vmlinuz-//')" ]] && echo "No reboot required" || echo "Reboot required"

exit 0
