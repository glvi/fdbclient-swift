// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: B032D36A-C062-40DD-A5CF-D61ABEE7BE81

import XCTest
@testable import FDBClient

final class NetworkTests: XCTestCase {

  override class func setUp() {
    try? FDB.selectApi(version: 730)
  }

  func testNetworkSetup() async throws {
    try await FDB.network.setup()
  }

  func testNetworkStartStop() async throws {
    try await FDB.network.setup()
    try await FDB.network.run()
    try await Task.sleep(nanoseconds: 3_000_000_000)
    try await FDB.network.stop()
  }

}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
