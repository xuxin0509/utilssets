#!/bin/bash

function printf_msg()
{
    if [ $# -ne 1 ]; then
        msg="message parameter error"
    fi

    msg="$1"
    printf "\e[31m%b%s\e[0m" "${msg}"
}

# SUDO
function sudo_variable()
{

    if [ ${UID} -ne 0 ]; then
        sudo_found=$(groups | grep -ic sudo)
        if [ ${sudo_found} -eq 0 ]; then
            printf_msg "user doesn't in sudo group, can't run as privilege!\n"
            SUDO="printf_msg \"can't run as privilege, skip!\n\" ; false &&"
        else
            SUDO=sudo
        fi
    fi
}

# BASH_RC
# OS_NAME
# OS_VERSION
# INSTALL_CMD
# PKG_MANAGER
# PKG_INSTALL
# PKG_UPDATE
function os_variable()
{
    BASH_RC="$HOME/.bashrc"
    OS_TYPE=$(uname -s)
    if [ "x${OS_TYPE}" == "xLinux" ]; then
        BASH_RC="$HOME/.bashrc"

        if [ -f '/etc/centos-release' ]; then
            OS_NAME='centos'
            OS_VERSION=`cat /etc/centos-release | grep -oE "[0-9]+.[0-9]+.[0-9]+"`
            INSTALL_CMD='yum install -y'
            PKG_MANAGER="yum"
            PKG_INSTALL="install -y"
            PKG_UPDATE="update"
        elif [ -f '/etc/redhat-release' ]; then
            OS_NAME='redhat'
            INSTALL_CMD='yum install -y'
            PKG_MANAGER="yum"
            PKG_INSTALL="install -y"
            PKG_UPDATE="update"
        elif [ -f '/etc/lsb-release' ]; then
            OS_NAME='ubuntu'
            OS_VERSION=`cat /etc/lsb-release | grep DISTRIB_RELEASE | cut -d'=' -f 2`
            INSTALL_CMD='apt install -y'
            PKG_MANAGER="apt"
            PKG_INSTALL="install -y"
            PKG_UPDATE="update"
        elif [ -f '/etc/debian_version' ]; then
            OS_NAME='debian'
            OS_VERSION=$(cat /etc/debian_version)
            INSTALL_CMD='apt install -y'
            PKG_MANAGER="apt"
            PKG_INSTALL="install -y"
            PKG_UPDATE="update"
        else
            abort "Can't recognize os type, abort."
        fi
    elif [ "x${OS_TYPE}" == "xDarwin" ]; then
        BASH_RC="$HOME/.bash_profile"
        OS_NAME=`sw_vers -productName`
        OS_VERSION=`sw_vers -productVersion`

        #Running Homebrew as root is extremely dangerous and no longer supported
        SUDO=''
        INSTALL_CMD='brew install'
        PKG_MANAGER="brew"
        PKG_INSTALL="install"
        PKG_UPDATE="update"
        if [ "${SHELL}" != "/bin/bash" ]; then
            echo "Please use bash as default interactive shell on ${OS_NAME}"
            exit 0
        fi
    fi

    echo "BASH_RC: ${BASH_RC}"
    echo "OS_TYPE: $OS_TYPE"
    echo "OS_NAME: $OS_NAME"
    echo "OS_VERSION: $OS_VERSION"
}

func_installing_status()
{
    if [ $# -eq 0 ]; then
        printf_msg "\nerror: requires package name to install it, exit..\n"
        exit 1
    fi

    echo "$@"

    for cml in "$@";
    do
        if [ -n "$(command -v ${cml})" ]; then
            echo "${cml} is alreay installed."
            continue
        fi

        eval $SUDO ${PKG_MANAGER} ${PKG_INSTALL} ${cml}
        if [ $? -ne 0 ]; then
            printf_msg "\nerror, failed to install: ${cml}, exit...\n"
            continue
        fi
    done
}

${SUDO} ${PKG_MANAGER} ${PKG_UPDATE}

sudo_variable
os_variable

func_installing_status git lsb-release curl
