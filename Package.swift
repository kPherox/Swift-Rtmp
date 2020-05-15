// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-rtmp",
  products: [
    .library(name: "CRTMP", targets: ["CRTMP"]),
    .library(name: "RTMP", type: .static, targets: ["RTMP"]),
  ],
  targets: [
    .systemLibrary(
      name: "CRTMP",
      pkgConfig: "librtmp",
      providers: [
        .brew(["rtmpdump"]),
        .apt(["librtmp-dev"]),
      ]
    ),
    .target(name: "RTMP", dependencies: ["CRTMP"]),
    //.testTarget(name: "RTMPTests", dependencies: ["RTMP"]),
  ]
)
