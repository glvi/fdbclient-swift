// -*- mode: swift; coding: utf-8-unix; indent-tabs-mode: nil; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: D0106033-5B79-4233-B519-36051C007A1A

import XCTest
@testable import FDBClient

final class ApiTests: XCTestCase {

  func testApiVersion() throws {
    XCTAssertThrowsError(try FDB.selectApi(version: CInt.max))
    try FDB.selectApi(version: 730)
  }

}

// End of file
