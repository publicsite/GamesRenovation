#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

git clone "https://gitlab.com/osslugaru/lugaru"

umask "${OLD_UMASK}"
