wget -c https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O apktool
wget -c https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.10.0.jar -O apktool.jar
chmod +x apktool*
# cmdline example
# apktool d -o chrome Chrome64_arm64.apk

#wget -c https://sourceforge.net/projects/dex2jar/files/latest/download/dex2jar-2.0.zip
wget -c https://github.com/DexPatcher/dex2jar/releases/download/v2.1-20190905-lanchon/dex-tools-2.1-20190905-lanchon.zip
unzip dex-tools-2.1-20190905-lanchon.zip
# cmdline example
# d2j-dex2jar.sh classes7.dex

wget -c https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar
# ui click open jd-gui-1.6.6.jar
