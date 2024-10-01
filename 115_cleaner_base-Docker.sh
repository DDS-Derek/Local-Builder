#!/bin/bash

Green="\033[32m"
Red="\033[31m"
Yellow='\033[33m'
Font="\033[0m"
INFO="[${Green}INFO${Font}]"
ERROR="[${Red}ERROR${Font}]"
WARN="[${Yellow}WARN${Font}]"
function INFO() {
echo -e "${INFO} ${1}"
}
function ERROR() {
echo -e "${ERROR} ${1}"
}
function WARN() {
echo -e "${WARN} ${1}"
}

Build_Dir=115_cleaner
Git_Repo="https://$(jq -r '.Github_Token' /etc/DDSRem/config.json)@github.com/DDS-Derek/xiaoya-alist-private.git"
Git_Br=master
Work_dir=$(pwd)
Git_Dir=$(mktemp -d --tmpdir="${Work_dir}")

INFO "Build_Dir=${Build_Dir}"
INFO "Git_Repo=${Git_Repo}"
INFO "Git_Br=${Git_Br}"
INFO "Work_dir=${Work_dir}"
INFO "Git_Dir=${Git_Dir}"

sleep 5

if [ "${Git_Br}" != "" ]; then
    git clone -b ${Git_Br} "${Git_Repo}" "${Git_Dir}"
else
    git clone "${Git_Repo}" "${Git_Dir}"
fi

cd "${Git_Dir}/${Build_Dir}" || exit
pwd
ls -al
bash Build.sh
cd "${Work_dir}" || exit
rm -rf "${Git_Dir}"

docker image rm tonistiigi/binfmt:latest
