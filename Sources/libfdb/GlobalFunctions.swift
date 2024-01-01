// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=4
//
// Package:
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 8D55883C-B1B0-4D2D-9F25-8DA9A988E0A6

import Clibfdb
import Foundation

/// Evaluates a closure to an FDB error code,
/// and throws an `FDBError` if that error code is `!=0`.
///
/// Example:
/// ```
/// try call { fdb_setup_network() }
/// ```
///
/// - Parameter closure: A closure that evaluates to an ``fdb_error_t``
/// - Throws: ``FDBError`` if the `closure` evaluates to something other than `0`.
func call(_ closure: @escaping () -> fdb_error_t) throws {
    let fdbErr = closure()
    guard fdbErr == 0 else {
        throw FDBError(fdbErr)
    }
}

/// When in an asynchronous context,
/// evaluates a closure to an FDB error code,
/// and throws an `FDBError` if that error code is `!=0`.
///
/// Example:
/// ```
/// try await call { fdb_setup_network() }
/// ```
///
/// - Parameter closure: A closure that evaluates to an ``fdb_error_t``
/// - Throws: ``FDBError`` if the `closure` evaluates to something other than `0`.
func call(_ closure: @escaping () -> fdb_error_t) async throws {
    try await Task {
        let fdbErr = closure()
        guard fdbErr == 0 else {
            throw FDBError(fdbErr)
        }
    }.value
}

// MARK: API

/// Selects the API version
///
/// - Parameter version: API version
/// - Throws: ``FDBError`` for an invalid API version
/// - Returns: ``version``
func selectApi<T: BinaryInteger>(version: T) throws -> T {
    try call { fdb_select_api_version_impl(CInt(version), FDB_API_VERSION) }
    return version
}

// MARK: NETWORK

/// Finishes configuration of the network
public func setupNetwork() throws {
    try call { fdb_setup_network() }
}

/// Starts the networking thread
public func runNetwork() throws {
    try call { fdb_run_network() }
}

/// Stops the networking thread
public func stopNetwork() throws {
    try call { fdb_stop_network() }
}

public func setNetwork(option: NetworkOption) throws {
    try call {
        fdb_network_set_option(option.rawValue, nil, 0)
    }
}

public func setNetwork(option: NetworkOption, to value: any BinaryInteger) throws {
    var value64 = UInt64(value).littleEndian
    try call {
        withUnsafeBytes(of: &value64) { bytes in
            fdb_network_set_option(option.rawValue, bytes.baseAddress!, CInt(bytes.count))
        }
    }
}

public func setNetwork(option: NetworkOption, to value: Data) throws {
    try call {
        value.withUnsafeBytes { bytes in
            fdb_network_set_option(option.rawValue, bytes.baseAddress!, CInt(bytes.count))
        }
    }
}

public func setNetwork(option: NetworkOption, to value: String? = nil) throws {
    if var value {
        try call {
            value.withUTF8 { bytes in
                fdb_network_set_option(option.rawValue, bytes.baseAddress!, CInt(bytes.count))
            }
        }
    } else {
        try call {
            fdb_network_set_option(option.rawValue, nil, 0)
        }
    }
}

// MARK: DATABASE

public func createDatabase(
  _ clusterFile: String = "",
  _ db: UnsafeMutablePointer<OpaquePointer?>!) throws {
    try call { fdb_create_database(clusterFile, db) }
}

public func createDatabase(
  from connectionString: String = "",
  _ db: UnsafeMutablePointer<OpaquePointer?>!) throws {
    try call { fdb_create_database_from_connection_string(connectionString, db) }
}

public func destroy(database db: OpaquePointer!) {
    fdb_database_destroy(db)
}

public func set(database db: OpaquePointer!, option: DatabaseOption) throws {
    try call {
        fdb_database_set_option(db, option.rawValue, nil, 0)
    }
}

public func set<T: BinaryInteger>(
  database db: OpaquePointer!,
  option: DatabaseOption,
  _ value: T) throws {
    var value64 = UInt64(value).littleEndian
    try call {
        withUnsafeBytes(of: &value64) { bytes in
            fdb_database_set_option(
              db, option.rawValue,
              bytes.baseAddress!, CInt(bytes.count))
        }
    }
}

// MARK: TRANSACTION

public func createTransaction(database db: OpaquePointer!) throws -> OpaquePointer? {
    var tx: OpaquePointer? = nil
    try call { fdb_database_create_transaction(db, &tx) }
    return tx
}

public func commit(transaction tx: OpaquePointer!) -> OpaquePointer? {
    fdb_transaction_commit(tx)
}

public func retry(transaction tx: OpaquePointer!, on error: FDBError) -> OpaquePointer? {
    fdb_transaction_on_error(tx, error.rawValue)
}

public func get(transaction tx: OpaquePointer!, key: Data, snapshot: Bool = false) -> OpaquePointer? {
    key.withUnsafeBytes { bytes in
        fdb_transaction_get(tx, bytes.baseAddress!, CInt(bytes.count), snapshot ? 1 : 0)
    }
}

public func set(transaction tx: OpaquePointer!, key: Data, value: Data) {
    key.withUnsafeBytes { keyBuffer in
        value.withUnsafeBytes { valueBuffer in
            fdb_transaction_set(
              tx,
              keyBuffer.baseAddress, Int32(keyBuffer.count),
              valueBuffer.baseAddress, Int32(valueBuffer.count))
        }
    }
}

public func clear(transaction tx: OpaquePointer!, key: Data) {
    key.withUnsafeBytes { bytes in
        fdb_transaction_clear(tx, bytes.baseAddress, CInt(bytes.count))
    }
}

// MARK: FUTURE

public func destroy(future f: OpaquePointer!) {
    fdb_future_destroy(f)
}

public func wait(forFuture f: OpaquePointer!) async throws {
    try await call {
        fdb_future_block_until_ready(f)
    }
}

public func getError(forFuture f: OpaquePointer!) -> FDBError? {
    let rawValue = fdb_future_get_error(f)
    guard rawValue == 0 else { return FDBError(rawValue) }
    return nil
}

public func error(forFuture f: OpaquePointer!) throws {
    let rawValue = fdb_future_get_error(f)
    guard rawValue == 0 else { throw FDBError(rawValue) }
}

public func data(forFuture f: OpaquePointer!) throws -> Data {
    var outPresent: fdb_bool_t = 0
    var outValue: UnsafePointer<UInt8>? = nil
    var outLength: Int32 = 0
    try call { fdb_future_get_value(f, &outPresent, &outValue, &outLength) }
    guard outPresent == 1 else { return Data() }
    guard let outValue else { return Data() }
    guard outLength > 0 else { return Data() }
    return Data(bytes: outValue, count: Int(outLength))
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// c-basic-offset: 4
// End:
