#!/bin/bash

echo -e "{\n    \""Build_Dir\"": \""libtorrent-rasterbar\"",\n    \""Git_Repo\"": \""https://github.com/DDS-Derek/qBittorrent_Skip_Patch-Builder.git\"",\n    \""Git_Br\"": \""$1\""\n}" > build.json
bash Build.sh
