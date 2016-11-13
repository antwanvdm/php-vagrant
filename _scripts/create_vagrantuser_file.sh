#!/bin/bash -l

echo "Creating local .vagrantuser file"

# Navigate to actual main directory (no mather where this script gets executed)
current_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${current_dir}/../

# Create .vagrantuser file (Rename parameters in file with dynamic magic)
echo "Creating & replacing .vagrantuser file"
project_name_dashes=$(echo ${PWD##*/} | sed 's/_/-/g')
project_absolute_path=$(echo ${PWD})

cat << EOF > .vagrantuser
# Use only / slashes otherwise it will be interpreted as escape character
project:
    name: "${project_name_dashes}"
    local_git_path: "${project_absolute_path}"
    provider: "virtualbox"
    ip_address: 192.168.50.5
    vagrant_max_memory: 2048
EOF
