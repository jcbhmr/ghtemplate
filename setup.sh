#!/bin/bash
set -e
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

rsync -av "$script_dir/" ./
rm form.yml
