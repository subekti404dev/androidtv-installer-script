#!/bin/bash

echo "## Downloading Apks !!!"
wget https://github.com/subekti404dev/androidtv-installer-script/raw/refs/heads/main/apps.zip -P /data/local/tmp

echo "## Unzipping Apks !!!"
mkdir /data/local/tmp/apps
busybox unzip /data/local/tmp/apps.zip -d /data/local/tmp/apps

echo "## Installing Apks !!!"
find /data/local/tmp/apps -type f -name "*.apk" | while read apk; do
    pm install -t -r $apk
done

echo "## Cleaning Up !!!"
rm -rf /data/local/tmp/apps
rm -rf /data/local/tmp/apps.zip