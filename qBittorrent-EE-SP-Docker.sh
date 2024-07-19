#!/bin/bash

echo -e "{\n    \""Build_Dir\"": \""\"",\n    \""Git_Repo\"": \""https://github.com/DDS-Derek/qBittorrent-EE-SP-Docker.git\"",\n    \""Git_Br\"": \""$1\""\n}" > build.json
bash Build.sh
