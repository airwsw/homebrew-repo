#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

patch_v2ray_core() {
    wget -P .cache/v2ray-core https://github.com/v2fly/v2ray-core/archive/$FILENAME
    sed -i "s/^  url \"https:\/\/github.com\/v2fly\/v2ray-core\/archive\/.*\"$/  url \"https:\/\/github.com\/v2fly\/v2ray-core\/archive\/$FILENAME\"/g" Formula/v2ray.rb
    SHA256SUM=$(sha256sum .cache/v2ray-core/$FILENAME | awk '{print $1}')
    sed -i "s/^  sha256 \".*\" # latest.tar.gz$/  sha256 \"$SHA256SUM\" # latest.tar.gz/g" Formula/v2ray.rb
    cat Formula/v2ray.rb | grep "# latest.tar.gz"
}

FILENAME=$(get_latest_release v2fly/v2ray-core).tar.gz patch_v2ray_core

patch_v2ray_rules_dat() {
    wget -P .cache/v2ray-rules-dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/$FILENAME
    SHA256SUM=$(sha256sum .cache/v2ray-rules-dat/$FILENAME | awk '{print $1}')
    sed -i "s/^    sha256 \".*\" # $FILENAME$/    sha256 \"$SHA256SUM\" # $FILENAME/g" Formula/v2ray.rb
    cat Formula/v2ray.rb | grep "# $FILENAME"
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

DATE=$(date +%Y%m%d)
sed -i "s/^  revision .*$/  revision $DATE/g" Formula/v2ray.rb
