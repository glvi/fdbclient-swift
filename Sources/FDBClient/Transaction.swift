// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: B6E9AF5F-1BAE-4B8F-AF7C-7A88CC44E845

import libfdb
import Foundation

extension FDB {

  public actor Transaction {

    private var tx: OpaquePointer!

    init(_ tx: OpaquePointer? = nil) {
      self.tx = tx
    }

    public func read(key: Data, snapshot: Bool = false) async throws -> Data {
      let f = get(transaction: tx, key: key, snapshot: snapshot)
      defer { destroy(future: f) }
      try await wait(forFuture: f)
      try error(forFuture: f)
      return try data(forFuture: f)
    }

    public func createOrUpdate(key: Data, value: Data) {
      set(transaction: tx, key: key, value: value)
    }

    /// Deletes all values with the specified key from the database
    public func delete(key: Data) {
      clear(transaction: tx, key: key)
    }

  }

} // FDB

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
