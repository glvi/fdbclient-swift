// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 17985BD9-E88E-4C6B-B381-CFE02A42A517

import libfdb
import Foundation

extension FDB {

  public actor Database {

    private var db: OpaquePointer? = nil

    deinit {
      destroy(database: db)
      db = nil
    }

    func open(clusterFile: String = "") throws {
      try createDatabase(clusterFile, &self.db)
    }

    func open(connectionString: String) throws {
      try createDatabase(from: connectionString, &self.db)
    }

    public func transaction<T>(_ closure: @escaping (_: Transaction) async throws -> T) async throws -> T {
      let tx = try createTransaction(database: db)
      repeat {
        let result = try await closure(Transaction(tx))
        let commit = commit(transaction: tx)
        defer { destroy(future: commit) }
        try await wait(forFuture: commit)
        let commitError = getError(forFuture: commit)
        if commitError == nil { return result }
        let retry = retry(transaction: tx, on: commitError!)
        defer { destroy(future: retry) }
        try await wait(forFuture: retry)
        try error(forFuture: retry)
      } while true
    }

  } // Database

} // FDB

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
