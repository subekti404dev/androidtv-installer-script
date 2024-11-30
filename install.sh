#!/bin/bash

if ! grep -q "20.205.243.166 github.com" /etc/hosts ; then
    echo "20.205.243.166 github.com" >> /etc/hosts
fi

echo "## Downloading Apks !!!"
wget https://github.com/subekti404dev/androidtv-installer-script/raw/refs/heads/main/apps.zip -P /data/local/tmp/

ls -lah /data/local/tmp

echo "## Unzipping Apks !!!"
mkdir /sdcard/urip_apps
busybox unzip /data/local/tmp/apps.zip -d /sdcard/urip_apps
rm -rf /data/local/tmp/apps/__MACOSX

ls -la /sdcard/urip_apps

echo "## Installing Apks !!!"
for file in /sdcard/urip_apps/*.apk
do
    echo "Installing $file:"

    pm install -r -d $file
done

echo "## Cleaning Up !!!"
rm -rf /sdcard/urip_apps
rm -rf /data/local/tmp/apps.zip