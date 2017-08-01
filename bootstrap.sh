#! /usr/bin/env bash
set -e


# Config
ZNC_VERSION="1.6.0"


# Ensure package list is up to date.
apt-get update

# Install runtime dependencies.
apt-get install -y sudo

# Install build dependencies.
apt-get install -y wget build-essential libssl-dev libperl-dev pkg-config unzip


# Prepare building
mkdir -p /src


# Download, compile and install ZNC.
cd /src
wget "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz"
tar -zxf "znc-${ZNC_VERSION}.tar.gz"
cd "znc-${ZNC_VERSION}"
./configure && make && make install
