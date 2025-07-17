#!/usr/bin/env bash

new_version=$1
old_version=$2

echo "new_version = $new_version"
echo "old_version = $old_version"

if [[ "$new_version" == "$old_version" ]]; then
  echo "New and old Chart versions are equal. Please increase the Chart version"
  exit 1
fi

new_version=(${new_version//./ })
old_version=(${old_version//./ })

if [[ "${#new_version[@]}" -eq "${#old_version[@]}" ]]; then
  version_length=${#new_version[@]}
else
  echo "Old and new version formats do not match"
  exit 1
fi

for i in $(seq 0 "$version_length"); do
  case "$i" in
    0)
    version="Major"
    ;;

    1)
    version="Minor"
    ;;

    *)
    version="Patch"
    ;;
  esac

  if [[ "${new_version[$i]}" -gt "${old_version[$i]}" ]]; then
    echo "$version version is greater than previous one"
    echo "Version is OK"
    break
  elif [[ "${new_version[$i]}" -eq "${old_version[$i]}" ]]; then
    echo "$version version is equal to previous one. Keep checking..."
  else
    echo "$version version is lower than previous one"
    echo "Version is not OK. Please increase the Chart version"
    exit 1
  fi
done

exit 0
