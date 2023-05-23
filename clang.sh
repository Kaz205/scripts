if [ -z "$1" ]
then
   echo "No Clang version specified"
   exit
fi

export CLANG_VERSION=clang-$1
rm -rf linux-x86
git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 -b master --depth=1 -j$(nproc --all)
cd linux-x86
tar -C . -cf $CLANG_VERSION.tar $CLANG_VERSION
xz -e -T8 -9 $CLANG_VERSION.tar
