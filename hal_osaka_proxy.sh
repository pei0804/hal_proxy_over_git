# License: MIT
# (c) 2016 jumpei"pei"chikamori http://ganbaruman.xyz/photofolio

#!/bin/bash

# 設定してください
user=学籍番号
password=認証PW

# git
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf
sed -i '' -e '/http/d' ~/.gitconfig
sed -i '' -e '/https/d' ~/.gitconfig

# npm
npm -g config delete proxy
npm -g config delete https-proxy

unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy

# HAL
if ping -c 3 proxy03.osaka.hal.ac.jp >/dev/null 2>&1
then
    proxy_hal=http://$user:$password@proxy03.osaka.hal.ac.jp:8080
    git config --global http.proxy $proxy_hal
    git config --global https.proxy $proxy_hal
    git config --global url."https://".insteadOf git://

    npm -g config set proxy $proxy_hal
    npm -g config set https-proxy $proxy_hal

    export http_proxy=$proxy_hal
    export https_proxy=$proxy_hal
    export ftp_proxy=$proxy_hal
    export all_proxy=$proxy_hal
fi
