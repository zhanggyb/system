#!/usr/bin/env bash
#
# A simple script to install necessary packages in different Linux distro
#

OS_NAME=""
PACKAGE_MANAGER=""
PACKAGE_MANAGER_INSTALL=""

if [ -f /etc/os-release ]; then
    source /etc/os-release
fi

if [[ -v NAME ]]; then
    OS_NAME=$NAME
fi

if [[ "x$OS_NAME" == "x" ]]; then
    echo "Unknown OS, ABORT!"
    exit 1
fi

OS_NAME=$(echo $OS_NAME | tr 'a-z' 'A-Z')
case $OS_NAME in
    "FEDORA")
        PACKAGE_MANAGER="dnf"
        PACKAGE_MANAGER_INSTALL="$PACKAGE_MANAGER install"
        ;;
    "UBUNTU")
        PACKAGE_MANAGER="apt"
        PACKAGE_MANAGER_INSTALL="$PACKAGE_MANAGER install"
        # $PACKAGE_MANAGER_INSTALL g++ make cmake
        ;;
    *)
        echo "Unknown OS, ABORT!"
        exit 2
        ;;
esac

printf "Done\n"
