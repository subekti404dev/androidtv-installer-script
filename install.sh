#!/bin/bash

if ! grep -q "20.205.243.166 github.com" /etc/hosts ; then
    echo "20.205.243.166 github.com" >> /etc/hosts
fi

echo "## Downloading Apks !!!"
wget https://github.com/subekti404dev/androidtv-installer-script/raw/refs/heads/main/apps.zip -P /data/local/tmp/

ls -lah /data/local/tmp

echo "## Unzipping Apks !!!"
mkdir /data/local/tmp/apps
busybox unzip /data/local/tmp/apps.zip -d /data/local/tmp/apps
rm -rf /data/local/tmp/apps/__MACOSX

echo "## Installing Apks !!!"
find /data/local/tmp/apps -name "*.apk" -print0 | while IFS= read -r -d '' apk; do
    echo "Installing: $apk"
    pm install "$apk"
done


echo "## Cleaning Up !!!"
rm -rf /data/local/tmp/apps
rm -rf /data/local/tmp/apps.zip