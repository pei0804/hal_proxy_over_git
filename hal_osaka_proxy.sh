# License: MIT
# (c) 2016 jumpei"pei"chikamori http://ganbaruman.xyz/photofolio

#!/bin/bash
# 初期設定
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf

unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy

# HAL
if ping -c 3 proxy03.osaka.hal.ac.jp >/dev/null 2>&1
then
    proxy_hal=http://学籍番号:認証PW@proxy03.osaka.hal.ac.jp:8080
    git config --global http.proxy $proxy_hal
    git config --global https.proxy $proxy_hal
    git config --global url."https://".insteadOf git://

    export http_proxy=$proxy_hal
    export https_proxy=$proxy_hal
    export ftp_proxy=$proxy_hal
    export all_proxy=$proxy_hal
fi