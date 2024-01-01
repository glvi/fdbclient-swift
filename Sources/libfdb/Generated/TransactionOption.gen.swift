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

extension TransactionOption {

    /// Allows this transaction to read and modify system keys (those that start with the byte 0xFF). Implies raw_access.
    public static let accessSystemKeys = TransactionOption(rawValue: FDB_TR_OPTION_ACCESS_SYSTEM_KEYS)

    /// Attach given authorization token to the transaction such that subsequent tenant-aware requests are authorized
    /// Parameter type: String; A JSON Web Token authorized to access data belonging to one or more tenants, indicated by 'tenants' claim of the token's payload.
    public static let authorizationToken = TransactionOption(rawValue: FDB_TR_OPTION_AUTHORIZATION_TOKEN)

    /// Adds a tag to the transaction that can be used to apply manual or automatic targeted throttling. At most 5 tags can be set on a transaction.
    /// Parameter type: String; String identifier used to associated this transaction with a throttling group. Must not exceed 16 characters.
    public static let autoThrottleTag = TransactionOption(rawValue: FDB_TR_OPTION_AUTO_THROTTLE_TAG)

    /// Automatically assign a random 16 byte idempotency id for this transaction. Prevents commits from failing with ``commit_unknown_result``. WARNING: If you are also using the multiversion client or transaction timeouts, if either cluster_version_changed or transaction_timed_out was thrown during a commit, then that commit may have already succeeded or may succeed in the future. This feature is in development and not ready for general use.
    public static let automaticIdempotency = TransactionOption(rawValue: FDB_TR_OPTION_AUTOMATIC_IDEMPOTENCY)

    /// Allows this transaction to bypass storage quota enforcement. Should only be used for transactions that directly or indirectly decrease the size of the tenant group's data.
    public static let bypassStorageQuota = TransactionOption(rawValue: FDB_TR_OPTION_BYPASS_STORAGE_QUOTA)

    /// Allows ``get`` operations to read from sections of keyspace that have become unreadable because of versionstamp operations. These reads will view versionstamp operations as if they were set operations that did not fill in the versionstamp.
    public static let bypassUnreadable = TransactionOption(rawValue: FDB_TR_OPTION_BYPASS_UNREADABLE)

    public static let causalReadDisable = TransactionOption(rawValue: FDB_TR_OPTION_CAUSAL_READ_DISABLE)

    /// The read version will be committed, and usually will be the latest committed, but might not be the latest committed in the event of a simultaneous fault and misbehaving clock.
    public static let causalReadRisky = TransactionOption(rawValue: FDB_TR_OPTION_CAUSAL_READ_RISKY)

    /// The transaction, if not self-conflicting, may be committed a second time after commit succeeds, in the event of a fault
    public static let causalWriteRisky = TransactionOption(rawValue: FDB_TR_OPTION_CAUSAL_WRITE_RISKY)

    public static let checkWritesEnable = TransactionOption(rawValue: FDB_TR_OPTION_CHECK_WRITES_ENABLE)

    /// Committing this transaction will bypass the normal load balancing across commit proxies and go directly to the specifically nominated 'first commit proxy'.
    public static let commitOnFirstProxy = TransactionOption(rawValue: FDB_TR_OPTION_COMMIT_ON_FIRST_PROXY)

    public static let debugDump = TransactionOption(rawValue: FDB_TR_OPTION_DEBUG_DUMP)

    /// Parameter type: String; Optional transaction name
    public static let debugRetryLogging = TransactionOption(rawValue: FDB_TR_OPTION_DEBUG_RETRY_LOGGING)

    /// Sets a client provided identifier for the transaction that will be used in scenarios like tracing or profiling. Client trace logging or transaction profiling must be separately enabled.
    /// Parameter type: String; String identifier to be used when tracing or profiling this transaction. The identifier must not exceed 100 characters.
    public static let debugTransactionIdentifier = TransactionOption(rawValue: FDB_TR_OPTION_DEBUG_TRANSACTION_IDENTIFIER)

    public static let durabilityDatacenter = TransactionOption(rawValue: FDB_TR_OPTION_DURABILITY_DATACENTER)

    @available(*, deprecated) public static let durabilityDevNullIsWebScale = TransactionOption(rawValue: FDB_TR_OPTION_DURABILITY_DEV_NULL_IS_WEB_SCALE)

    public static let durabilityRisky = TransactionOption(rawValue: FDB_TR_OPTION_DURABILITY_RISKY)

    /// Asks storage servers for how many bytes a clear key range contains. Otherwise uses the location cache to roughly estimate this.
    public static let expensiveClearCostEstimationEnable = TransactionOption(rawValue: FDB_TR_OPTION_EXPENSIVE_CLEAR_COST_ESTIMATION_ENABLE)

    /// No other transactions will be applied before this transaction within the same commit version.
    public static let firstInBatch = TransactionOption(rawValue: FDB_TR_OPTION_FIRST_IN_BATCH)

    /// Associate this transaction with this ID for the purpose of checking whether or not this transaction has already committed. Must be at least 16 bytes and less than 256 bytes. This feature is in development and not ready for general use. Unless the automatic_idempotency option is set after this option, the client will not automatically attempt to remove this id from the cluster after a successful commit.
    /// Parameter type: String; Unique ID
    public static let idempotencyId = TransactionOption(rawValue: FDB_TR_OPTION_IDEMPOTENCY_ID)

    /// Addresses returned by get_addresses_for_key include the port when enabled. As of api version 630, this option is enabled by default and setting this has no effect.
    public static let includePortInAddress = TransactionOption(rawValue: FDB_TR_OPTION_INCLUDE_PORT_IN_ADDRESS)

    /// This is a write-only transaction which sets the initial configuration. This option is designed for use by database system tools only.
    public static let initializeNewDatabase = TransactionOption(rawValue: FDB_TR_OPTION_INITIALIZE_NEW_DATABASE)

    /// The transaction can read and write to locked databases, and is responsible for checking that it took the lock.
    public static let lockAware = TransactionOption(rawValue: FDB_TR_OPTION_LOCK_AWARE)

    /// Enables tracing for this transaction and logs results to the client trace logs. The DEBUG_TRANSACTION_IDENTIFIER option must be set before using this option, and client trace logging must be enabled to get log output.
    public static let logTransaction = TransactionOption(rawValue: FDB_TR_OPTION_LOG_TRANSACTION)

    /// Set the maximum amount of backoff delay incurred in the call to ``onError`` if the error is retryable. Defaults to 1000 ms. Valid parameter values are ``[0, INT_MAX]``. If the maximum retry delay is less than the current retry delay of the transaction, then the current retry delay will be clamped to the maximum retry delay. Prior to API version 610, like all other transaction options, the maximum retry delay must be reset after a call to ``onError``. If the API version is 610 or greater, the retry limit is not reset after an ``onError`` call. Note that at all API versions, it is safe and legal to set the maximum retry delay each time the transaction begins, so most code written assuming the older behavior can be upgraded to the newer behavior without requiring any modification, and the caller is not required to implement special logic in retry loops to only conditionally set this option.
    /// Parameter type: Int; value in milliseconds of maximum delay
    public static let maxRetryDelay = TransactionOption(rawValue: FDB_TR_OPTION_MAX_RETRY_DELAY)

    /// The next write performed on this transaction will not generate a write conflict range. As a result, other transactions which read the key(s) being modified by the next write will not conflict with this transaction. Care needs to be taken when using this option on a transaction that is shared between multiple threads. When setting this option, write conflict ranges will be disabled on the next write operation, regardless of what thread it is on.
    public static let nextWriteNoWriteConflictRange = TransactionOption(rawValue: FDB_TR_OPTION_NEXT_WRITE_NO_WRITE_CONFLICT_RANGE)

    /// Specifies that this transaction should be treated as low priority and that default priority transactions will be processed first. Batch priority transactions will also be throttled at load levels smaller than for other types of transactions and may be fully cut off in the event of machine failures. Useful for doing batch work simultaneously with latency-sensitive work
    public static let priorityBatch = TransactionOption(rawValue: FDB_TR_OPTION_PRIORITY_BATCH)

    /// Specifies that this transaction should be treated as highest priority and that lower priority transactions should block behind this one. Use is discouraged outside of low-level tools
    public static let prioritySystemImmediate = TransactionOption(rawValue: FDB_TR_OPTION_PRIORITY_SYSTEM_IMMEDIATE)

    /// Allows this transaction to access the raw key-space when tenant mode is on.
    public static let rawAccess = TransactionOption(rawValue: FDB_TR_OPTION_RAW_ACCESS)

    @available(*, deprecated) public static let readAheadDisable = TransactionOption(rawValue: FDB_TR_OPTION_READ_AHEAD_DISABLE)

    /// The transaction can read from locked databases.
    public static let readLockAware = TransactionOption(rawValue: FDB_TR_OPTION_READ_LOCK_AWARE)

    /// Use high read priority for subsequent read requests in this transaction.
    public static let readPriorityHigh = TransactionOption(rawValue: FDB_TR_OPTION_READ_PRIORITY_HIGH)

    /// Use low read priority for subsequent read requests in this transaction.
    public static let readPriorityLow = TransactionOption(rawValue: FDB_TR_OPTION_READ_PRIORITY_LOW)

    /// Use normal read priority for subsequent read requests in this transaction.  This is the default read priority.
    public static let readPriorityNormal = TransactionOption(rawValue: FDB_TR_OPTION_READ_PRIORITY_NORMAL)

    /// Storage server should not cache disk blocks needed for subsequent read requests in this transaction.  This can be used to avoid cache pollution for reads not expected to be repeated.
    public static let readServerSideCacheDisable = TransactionOption(rawValue: FDB_TR_OPTION_READ_SERVER_SIDE_CACHE_DISABLE)

    /// Storage server should cache disk blocks needed for subsequent read requests in this transaction.  This is the default behavior.
    public static let readServerSideCacheEnable = TransactionOption(rawValue: FDB_TR_OPTION_READ_SERVER_SIDE_CACHE_ENABLE)

    /// Allows this transaction to read system keys (those that start with the byte 0xFF). Implies raw_access.
    public static let readSystemKeys = TransactionOption(rawValue: FDB_TR_OPTION_READ_SYSTEM_KEYS)

    /// Reads performed by a transaction will not see any prior mutations that occured in that transaction, instead seeing the value which was in the database at the transaction's read version. This option may provide a small performance benefit for the client, but also disables a number of client-side optimizations which are beneficial for transactions which tend to read and write the same keys within a single transaction. It is an error to set this option after performing any reads or writes on the transaction.
    public static let readYourWritesDisable = TransactionOption(rawValue: FDB_TR_OPTION_READ_YOUR_WRITES_DISABLE)

    /// The transaction can retrieve keys that are conflicting with other transactions.
    public static let reportConflictingKeys = TransactionOption(rawValue: FDB_TR_OPTION_REPORT_CONFLICTING_KEYS)

    /// Set a maximum number of retries after which additional calls to ``onError`` will throw the most recently seen error code. Valid parameter values are ``[-1, INT_MAX]``. If set to -1, will disable the retry limit. Prior to API version 610, like all other transaction options, the retry limit must be reset after a call to ``onError``. If the API version is 610 or greater, the retry limit is not reset after an ``onError`` call. Note that at all API versions, it is safe and legal to set the retry limit each time the transaction begins, so most code written assuming the older behavior can be upgraded to the newer behavior without requiring any modification, and the caller is not required to implement special logic in retry loops to only conditionally set this option.
    /// Parameter type: Int; number of times to retry
    public static let retryLimit = TransactionOption(rawValue: FDB_TR_OPTION_RETRY_LIMIT)

    /// Sets an identifier for server tracing of this transaction. When committed, this identifier triggers logging when each part of the transaction authority encounters it, which is helpful in diagnosing slowness in misbehaving clusters. The identifier is randomly generated. When there is also a debug_transaction_identifier, both IDs are logged together.
    public static let serverRequestTracing = TransactionOption(rawValue: FDB_TR_OPTION_SERVER_REQUEST_TRACING)

    /// Set the transaction size limit in bytes. The size is calculated by combining the sizes of all keys and values written or mutated, all key ranges cleared, and all read and write conflict ranges. (In other words, it includes the total size of all data included in the request to the cluster to commit the transaction.) Large transactions can cause performance problems on FoundationDB clusters, so setting this limit to a smaller value than the default can help prevent the client from accidentally degrading the cluster's performance. This value must be at least 32 and cannot be set to higher than 10,000,000, the default transaction size limit.
    /// Parameter type: Int; value in bytes
    public static let sizeLimit = TransactionOption(rawValue: FDB_TR_OPTION_SIZE_LIMIT)

    /// Specifically instruct this transaction to NOT use cached GRV. Primarily used for the read version cache's background updater to avoid attempting to read a cached entry in specific situations.
    public static let skipGrvCache = TransactionOption(rawValue: FDB_TR_OPTION_SKIP_GRV_CACHE)

    /// Snapshot read operations will not see the results of writes done in the same transaction. This was the default behavior prior to API version 300.
    public static let snapshotRywDisable = TransactionOption(rawValue: FDB_TR_OPTION_SNAPSHOT_RYW_DISABLE)

    /// Snapshot read operations will see the results of writes done in the same transaction. This is the default behavior.
    public static let snapshotRywEnable = TransactionOption(rawValue: FDB_TR_OPTION_SNAPSHOT_RYW_ENABLE)

    /// Adds a parent to the Span of this transaction. Used for transaction tracing. A span can be identified with any 16 bytes
    /// Parameter type: Data; A byte string of length 16 used to associate the span of this transaction with a parent
    public static let spanParent = TransactionOption(rawValue: FDB_TR_OPTION_SPAN_PARENT)

    /// By default, users are not allowed to write to special keys. Enable this option will implicitly enable all options required to achieve the configuration change.
    public static let specialKeySpaceEnableWrites = TransactionOption(rawValue: FDB_TR_OPTION_SPECIAL_KEY_SPACE_ENABLE_WRITES)

    /// By default, the special key space will only allow users to read from exactly one module (a subspace in the special key space). Use this option to allow reading from zero or more modules. Users who set this option should be prepared for new modules, which may have different behaviors than the modules they're currently reading. For example, a new module might block or return an error.
    public static let specialKeySpaceRelaxed = TransactionOption(rawValue: FDB_TR_OPTION_SPECIAL_KEY_SPACE_RELAXED)

    /// Adds a tag to the transaction that can be used to apply manual targeted throttling. At most 5 tags can be set on a transaction.
    /// Parameter type: String; String identifier used to associated this transaction with a throttling group. Must not exceed 16 characters.
    public static let tag = TransactionOption(rawValue: FDB_TR_OPTION_TAG)

    /// Set a timeout in milliseconds which, when elapsed, will cause the transaction automatically to be cancelled. Valid parameter values are ``[0, INT_MAX]``. If set to 0, will disable all timeouts. All pending and any future uses of the transaction will throw an exception. The transaction can be used again after it is reset. Prior to API version 610, like all other transaction options, the timeout must be reset after a call to ``onError``. If the API version is 610 or greater, the timeout is not reset after an ``onError`` call. This allows the user to specify a longer timeout on specific transactions than the default timeout specified through the ``transaction_timeout`` database option without the shorter database timeout cancelling transactions that encounter a retryable error. Note that at all API versions, it is safe and legal to set the timeout each time the transaction begins, so most code written assuming the older behavior can be upgraded to the newer behavior without requiring any modification, and the caller is not required to implement special logic in retry loops to only conditionally set this option.
    /// Parameter type: Int; value in milliseconds of timeout
    public static let timeout = TransactionOption(rawValue: FDB_TR_OPTION_TIMEOUT)

    /// Parameter type: String; String identifier to be used in the logs when tracing this transaction. The identifier must not exceed 100 characters.
    @available(*, deprecated) public static let transactionLoggingEnable = TransactionOption(rawValue: FDB_TR_OPTION_TRANSACTION_LOGGING_ENABLE)

    /// Sets the maximum escaped length of key and value fields to be logged to the trace file via the LOG_TRANSACTION option, after which the field will be truncated. A negative value disables truncation.
    /// Parameter type: Int; Maximum length of escaped key and value fields.
    public static let transactionLoggingMaxFieldLength = TransactionOption(rawValue: FDB_TR_OPTION_TRANSACTION_LOGGING_MAX_FIELD_LENGTH)

    /// Allows this transaction to use cached GRV from the database context. Defaults to off. Upon first usage, starts a background updater to periodically update the cache to avoid stale read versions. The disable_client_bypass option must also be set.
    public static let useGrvCache = TransactionOption(rawValue: FDB_TR_OPTION_USE_GRV_CACHE)

    /// This option should only be used by tools which change the database configuration.
    public static let useProvisionalProxies = TransactionOption(rawValue: FDB_TR_OPTION_USE_PROVISIONAL_PROXIES)

    /// By default, operations that are performed on a transaction while it is being committed will not only fail themselves, but they will attempt to fail other in-flight operations (such as the commit) as well. This behavior is intended to help developers discover situations where operations could be unintentionally executed after the transaction has been reset. Setting this option removes that protection, causing only the offending operation to fail.
    public static let usedDuringCommitProtectionDisable = TransactionOption(rawValue: FDB_TR_OPTION_USED_DURING_COMMIT_PROTECTION_DISABLE)
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// swift-mode:basic-offset: 4
// End:
