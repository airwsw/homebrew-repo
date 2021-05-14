#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

patch_v2ray_rules_version() {
    sed -i "s/^  version \".*\"$/  version \"$VERSION\"/g" Formula/v2ray-rules.rb
    cat Formula/v2ray-rules.rb | grep "# latest.tar.gz"
}

VERSION=$(get_latest_release Loyalsoldier/v2ray-rules-dat) patch_v2ray_rules_version

patch_v2ray_rules_dat() {
    wget -P .cache/v2ray-rules-dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/$FILENAME
    SHA256SUM=$(sha256sum .cache/v2ray-rules-dat/$FILENAME | awk '{print $1}')
    sed -i "s/^    sha256 \".*\" # $FILENAME$/    sha256 \"$SHA256SUM\" # $FILENAME/g" Formula/v2ray-rules.rb
    cat Formula/v2ray-rules.rb | grep "# $FILENAME"
}

FILENAME=apple-cn.txt        patch_v2ray_rules_dat
FILENAME=direct-list.txt     patch_v2ray_rules_dat
FILENAME=direct-tld-list.txt patch_v2ray_rules_dat
FILENAME=geoip.dat           patch_v2ray_rules_dat
FILENAME=geosite.dat         patch_v2ray_rules_dat
FILENAME=gfw.txt             patch_v2ray_rules_dat
FILENAME=google-cn.txt       patch_v2ray_rules_dat
FILENAME=greatfire.txt       patch_v2ray_rules_dat
FILENAME=proxy-list.txt      patch_v2ray_rules_dat
FILENAME=proxy-tld-list.txt  patch_v2ray_rules_dat
FILENAME=reject-list.txt     patch_v2ray_rules_dat
FILENAME=win-extra.txt       patch_v2ray_rules_dat
FILENAME=win-spy.txt         patch_v2ray_rules_dat
FILENAME=win-update.txt      patch_v2ray_rules_dat
