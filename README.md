# WebRTC-Build

[![github tag (latest semver)](https://img.shields.io/github/tag/iakuf/webrtc-build.svg)](https://github.com/iakuf/webrtc-build)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Actions Status](https://github.com/shiguredo-webrtc-build/webrtc-build/workflows/build/badge.svg)](https://github.com/iakuf/webrtc-build/actions)


## 有关 WebRTC-Build 

提供编译各个平台环境的 WebRTC 的脚本, 本项目来自于 [shiguredo-webrtc-build](https://github.com/shiguredo-webrtc-build/webrtc-build)
因为原平台不能 fork 无法提交问题和无法修改, 所以建立的本项目.

- 本项目修复了 mac m1 在 arm64 平台上的编译.
- gclient 增加了多线程, 用于加快同步.
- 增加了非 docker 的 ubuntu 环境编译的支持.


## 编译打包的文件包含 

- WebRTC 库（webrtc.lib 或 libwebrtc.a）
- WebRTC 包含头文件
- WebRTC 版本信息（提交哈希）

## 目前支持的平台 

- windows x86_64
- macos_arm64
- macos_x86_64
- raspberry-pi-os_armv6 (Raspberry Pi Zero)
- raspberry-pi-os_armv7 (Raspberry Pi 3, 4)
- raspberry-pi-os_armv8 (Raspberry Pi 3, 4)
- ubuntu-18.04_armv8
    - Jetson Nano
    - Jetson Xavier NX
    - Jetson AGX Xavier
- ubuntu-18.04_x86_64
- ubuntu-20.04_x86_64
- android
- ios

## License 

Apache License 2.0

```
Copyright 2019-2021, Wandbox LLC (Original Author)
Copyright 2019-2021, Shiguredo Inc.
Copyright 2021-2022, 扶凯 

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# WebRTC-Build