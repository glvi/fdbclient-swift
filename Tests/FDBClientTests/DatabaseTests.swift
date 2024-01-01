// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 99017C82-A3DA-4024-9EC0-5C717772E967

import XCTest
@testable import FDBClient

final class DatabaseTests: XCTestCase {

  private var database = FDB.Database()

  override class func setUp() {
    try? FDB.selectApi(version: 730)
  }

  override func setUp() async throws {
    try await FDB.network.setup()
    try await FDB.network.run()
    try await database.open()
  }

  func testWriteReadDistinctTransactions() async throws {
    guard await FDB.network.isRunning else {
      throw XCTSkip("FDB network is not running")
    }
    let strKey = "de.glvi.experimental.\(#function)"
    let strVal = "The quick brown fox jumps over the lazy dog"
    let datKey = strKey.data(using: .utf8)!
    let datVal = strVal.data(using: .utf8)!
    try await database.transaction { tx in
      await tx.createOrUpdate(key: datKey, value: datVal)
    }
    let datVal2 = try await database.transaction { tx in
      try await tx.read(key: datKey)
    }
    let strVal2 = String(data: datVal2, encoding: .utf8)!
    XCTAssertEqual(strVal, strVal2)
  }

  func testWriteReadSameTransactions() async throws {
    guard await FDB.network.isRunning else {
      throw XCTSkip("FDB network is not running")
    }
    let strKey = "de.glvi.experimental.\(#function)"
    let strVal = "The quick brown fox jumps over the lazy dog"
    let datKey = strKey.data(using: .utf8)!
    let datVal = strVal.data(using: .utf8)!
    let datVal2 = try await database.transaction { tx in
      await tx.createOrUpdate(key: datKey, value: datVal)
      return try await tx.read(key: datKey)
    }
    let strVal2 = String(data: datVal2, encoding: .utf8)!
    XCTAssertEqual(strVal, strVal2)
  }
} // DatabaseTests

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
