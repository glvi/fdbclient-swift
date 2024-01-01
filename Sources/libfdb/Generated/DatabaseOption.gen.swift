// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=4
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// This file was automatically generated. DO NOT EDIT.
//
// UUID: 6C7D4C74-C2C8-41AF-8052-BAC1AF26BBC2

import Clibfdb
import Foundation

extension DatabaseOption {

    /// Specify the datacenter ID that was passed to fdbserver processes running in the same datacenter as this client, for better location-aware load balancing.
    /// Parameter type: String; Hexadecimal ID
    public static let datacenterId = DatabaseOption(rawValue: FDB_DB_OPTION_DATACENTER_ID)

    /// Set the size of the client location cache. Raising this value can boost performance in very large databases where clients access data in a near-random pattern. Defaults to 100000.
    /// Parameter type: Int; Max location cache entries
    public static let locationCacheSize = DatabaseOption(rawValue: FDB_DB_OPTION_LOCATION_CACHE_SIZE)

    /// Specify the machine ID that was passed to fdbserver processes running on the same machine as this client, for better location-aware load balancing.
    /// Parameter type: String; Hexadecimal ID
    public static let machineId = DatabaseOption(rawValue: FDB_DB_OPTION_MACHINE_ID)

    /// Set the maximum number of watches allowed to be outstanding on a database connection. Increasing this number could result in increased resource usage. Reducing this number will not cancel any outstanding watches. Defaults to 10000 and cannot be larger than 1000000.
    /// Parameter type: Int; Max outstanding watches
    public static let maxWatches = DatabaseOption(rawValue: FDB_DB_OPTION_MAX_WATCHES)

    /// Snapshot read operations will not see the results of writes done in the same transaction. This was the default behavior prior to API version 300.
    public static let snapshotRywDisable = DatabaseOption(rawValue: FDB_DB_OPTION_SNAPSHOT_RYW_DISABLE)

    /// Snapshot read operations will see the results of writes done in the same transaction. This is the default behavior.
    public static let snapshotRywEnable = DatabaseOption(rawValue: FDB_DB_OPTION_SNAPSHOT_RYW_ENABLE)

    /// Enables verification of causal read risky by checking whether clients are able to read stale data when they detect a recovery, and logging an error if so.
    /// Parameter type: Int; integer between 0 and 100 expressing the probability a client will verify it can't read stale data
    public static let testCausalReadRisky = DatabaseOption(rawValue: FDB_DB_OPTION_TEST_CAUSAL_READ_RISKY)

    /// Set a random idempotency id for all transactions. See the transaction option description for more information. This feature is in development and not ready for general use.
    public static let transactionAutomaticIdempotency = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_AUTOMATIC_IDEMPOTENCY)

    /// Allows ``get`` operations to read from sections of keyspace that have become unreadable because of versionstamp operations. This sets the ``bypass_unreadable`` option of each transaction created by this database. See the transaction option description for more information.
    public static let transactionBypassUnreadable = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_BYPASS_UNREADABLE)

    /// The read version will be committed, and usually will be the latest committed, but might not be the latest committed in the event of a simultaneous fault and misbehaving clock.
    public static let transactionCausalReadRisky = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_CAUSAL_READ_RISKY)

    /// Deprecated. Addresses returned by get_addresses_for_key include the port when enabled. As of api version 630, this option is enabled by default and setting this has no effect.
    public static let transactionIncludePortInAddress = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_INCLUDE_PORT_IN_ADDRESS)

    /// Sets the maximum escaped length of key and value fields to be logged to the trace file via the LOG_TRANSACTION option. This sets the ``transaction_logging_max_field_length`` option of each transaction created by this database. See the transaction option description for more information.
    /// Parameter type: Int; Maximum length of escaped key and value fields.
    public static let transactionLoggingMaxFieldLength = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_LOGGING_MAX_FIELD_LENGTH)

    /// Set the maximum amount of backoff delay incurred in the call to ``onError`` if the error is retryable. This sets the ``max_retry_delay`` option of each transaction created by this database. See the transaction option description for more information.
    /// Parameter type: Int; value in milliseconds of maximum delay
    public static let transactionMaxRetryDelay = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_MAX_RETRY_DELAY)

    /// Enables conflicting key reporting on all transactions, allowing them to retrieve the keys that are conflicting with other transactions.
    public static let transactionReportConflictingKeys = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_REPORT_CONFLICTING_KEYS)

    /// Set a maximum number of retries after which additional calls to ``onError`` will throw the most recently seen error code. This sets the ``retry_limit`` option of each transaction created by this database. See the transaction option description for more information.
    /// Parameter type: Int; number of times to retry
    public static let transactionRetryLimit = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_RETRY_LIMIT)

    /// Set the maximum transaction size in bytes. This sets the ``size_limit`` option on each transaction created by this database. See the transaction option description for more information.
    /// Parameter type: Int; value in bytes
    public static let transactionSizeLimit = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_SIZE_LIMIT)

    /// Set a timeout in milliseconds which, when elapsed, will cause each transaction automatically to be cancelled. This sets the ``timeout`` option of each transaction created by this database. See the transaction option description for more information. Using this option requires that the API version is 610 or higher.
    /// Parameter type: Int; value in milliseconds of timeout
    public static let transactionTimeout = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_TIMEOUT)

    /// By default, operations that are performed on a transaction while it is being committed will not only fail themselves, but they will attempt to fail other in-flight operations (such as the commit) as well. This behavior is intended to help developers discover situations where operations could be unintentionally executed after the transaction has been reset. Setting this option removes that protection, causing only the offending operation to fail.
    public static let transactionUsedDuringCommitProtectionDisable = DatabaseOption(rawValue: FDB_DB_OPTION_TRANSACTION_USED_DURING_COMMIT_PROTECTION_DISABLE)

    /// Use configuration database.
    public static let useConfigDatabase = DatabaseOption(rawValue: FDB_DB_OPTION_USE_CONFIG_DATABASE)
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// swift-mode:basic-offset: 4
// End:
