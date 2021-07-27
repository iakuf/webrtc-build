#!/bin/bash

cd `dirname $0`
source VERSION
SCRIPT_DIR="`pwd`"

PACKAGE_NAME=ubuntu-18.04_x86_64
SOURCE_DIR="`pwd`/_source/$PACKAGE_NAME"
BUILD_DIR="`pwd`/_build/$PACKAGE_NAME"
PACKAGE_DIR="`pwd`/_package/$PACKAGE_NAME"
STATIC_DIR="/data/static"

set -ex

# ======= ここまでは全ての build.*.sh で共通（PACKAGE_NAME だけ変える）

./scripts/get_depot_tools.sh $SOURCE_DIR
export PATH="$SOURCE_DIR/depot_tools:$PATH"

./scripts/prepare_webrtc.sh $SOURCE_DIR $WEBRTC_COMMIT
pushd $SOURCE_DIR/webrtc/src
  patch -p2 < $SCRIPT_DIR/patches/4k.patch
popd

./scripts/install_webrtc_build_deps.sh $SOURCE_DIR x86_64

#rtc_build_examples=false 引起 json  报错
pushd $SOURCE_DIR/webrtc/src
  gn gen $BUILD_DIR/webrtc --args='
    target_os="linux"
    is_debug=true
    rtc_use_pipewire=true
    rtc_include_tests=false
    rtc_use_h264=false
    is_component_build=false
    use_rtti=false
    treat_warnings_as_errors=false
    use_custom_libcxx=false
  '
  ninja -C $BUILD_DIR/webrtc
popd


pushd $SOURCE_DIR/webrtc/src
 # python2 tools_webrtc/libs/generate_licenses.py --target :webrtc $BUILD_DIR/webrtc/ $BUILD_DIR/webrtc/
popd

pushd $BUILD_DIR/webrtc/obj
  $SOURCE_DIR/webrtc/src/third_party/llvm-build/Release+Asserts/bin/llvm-ar -rc $BUILD_DIR/webrtc/libwebrtc.a `find . -name '*.o'`
popd

./scripts/package_webrtc.sh $SCRIPT_DIR/static $SOURCE_DIR $BUILD_DIR $PACKAGE_DIR $SCRIPT_DIR/VERSION
