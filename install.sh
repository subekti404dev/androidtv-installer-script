#!/bin/bash

if ! grep -q "20.205.243.166 github.com" /etc/hosts ; then
    echo "20.205.243.166 github.com" >> /etc/hosts
fi

# echo "## Downloading Apks !!!"
# wget https://file.uripsub.dev/api/public/dl/MdEH6zB5/urip/apps/apps.zip -P /data/local/tmp/

# ls -lah /data/local/tmp

# echo "## Unzipping Apks !!!"
# mkdir /sdcard/urip_apps
# busybox unzip /data/local/tmp/apps.zip -d /sdcard/urip_apps
# rm -rf /data/local/tmp/apps/__MACOSX

# ls -la /sdcard/urip_apps

# echo "Disable App Verification"
# settings put global development_settings_enabled 1
# settings put global verify_apps_over_usb 0

# echo "## Installing Apks !!!"
# for file in /sdcard/urip_apps/*.apk
# do
#     echo "Installing $file:"

#     pm install -r -d $file
# done

echo "## Download Apps Data"
wget https://file.uripsub.dev/api/public/dl/6xq6DCzw/urip/apps/apps-data.zip -P /data/local/tmp/

echo "## Unzipping Apps Data !!!"
mkdir /sdcard/urip_apps_data
busybox unzip /data/local/tmp/apps-data.zip -d /sdcard/urip_apps_data

echo "# Copy to Apps Data to /data/data"
cp -R /sdcard/urip_apps_data/* /data/data/

echo "## Cleaning Up !!!"
rm -rf /sdcard/urip_apps
rm -rf /sdcard/urip_apps_data
rm -rf /data/local/tmp/apps.zip
rm -rf /data/local/tmp/apps-data.zip
