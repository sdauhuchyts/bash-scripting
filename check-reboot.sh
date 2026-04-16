#!/usr/bin/env bash
# Check if a kernel reboot is required by comparing running vs boot kernel

current_kernel=$(uname -r)
boot_kernel=$(readlink /boot/vmlinuz 2>/dev/null | sed 's/vmlinuz-//')

if [[ -z "$boot_kernel" ]]; then
  echo "Error: Cannot determine boot kernel version" >&2
  exit 1
fi

if [[ "$current_kernel" == "$boot_kernel" ]]; then
  echo "No reboot required"
  exit 0
else
  echo "Reboot required (Current: $current_kernel, Boot: $boot_kernel)"
  exit 1
fi
