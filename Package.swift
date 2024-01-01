// swift-tools-version: 5.9
// vi:ai:et:sw=2

import PackageDescription

let package = Package(
  name: "FDBClient",
  platforms: [.macOS(.v13)],
  products: [
    .library(name: "FDBClient", type: .dynamic, targets: ["FDBClient"]),
  ],
  targets: [
    .target(name: "FDBClient", dependencies: ["libfdb"]),
    .target(name: "libfdb", dependencies: ["Clibfdb"]),
    .systemLibrary(name: "Clibfdb", pkgConfig: "libfdb_c"),
    // Test targets
    .testTarget(name: "FDBClientTests", dependencies: ["FDBClient"]),
  ]
)

// Local Variables:
// mode: swift
// coding: utf-8-unix
// indent-tabs-mode: nil
// End:
