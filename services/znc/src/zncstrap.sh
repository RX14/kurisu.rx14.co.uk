#! /usr/bin/env bash
set -e


# Config
ZNCSTRAP_VERSION="dev"


# Add zncstrap theme
cd /
wget "https://github.com/ProjectFirrre/zncstrap/archive/${ZNCSTRAP_VERSION}.zip" -O "zncstrap-${ZNCSTRAP_VERSION}.zip"
unzip "zncstrap-${ZNCSTRAP_VERSION}.zip"
cd "zncstrap-${ZNCSTRAP_VERSION}"

rm -Rf /usr/share/znc/webskins/
rm -Rf /usr/share/znc/modules/
mv webskins /usr/share/znc/
mv modules /usr/share/znc/


# Clean up
apt-get remove -y unzip wget
apt-get autoremove -y
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
