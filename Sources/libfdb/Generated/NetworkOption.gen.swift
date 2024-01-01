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

extension NetworkOption {

    public static let buggifyDisable = NetworkOption(rawValue: FDB_NET_OPTION_BUGGIFY_DISABLE)

    public static let buggifyEnable = NetworkOption(rawValue: FDB_NET_OPTION_BUGGIFY_ENABLE)

    /// Set the probability of a BUGGIFY section being active for the current execution.  Only applies to code paths first traversed AFTER this option is changed.
    /// Parameter type: Int; probability expressed as a percentage between 0 and 100
    public static let buggifySectionActivatedProbability = NetworkOption(rawValue: FDB_NET_OPTION_BUGGIFY_SECTION_ACTIVATED_PROBABILITY)

    /// Set the probability of an active BUGGIFY section being fired
    /// Parameter type: Int; probability expressed as a percentage between 0 and 100
    public static let buggifySectionFiredProbability = NetworkOption(rawValue: FDB_NET_OPTION_BUGGIFY_SECTION_FIRED_PROBABILITY)

    /// Set the ca bundle
    /// Parameter type: Data; ca bundle
    public static let tlsCaBytes = NetworkOption(rawValue: FDB_NET_OPTION_TLS_CA_BYTES)

    /// Set the file from which to load the certificate authority bundle
    /// Parameter type: String; file path
    public static let tlsCaPath = NetworkOption(rawValue: FDB_NET_OPTION_TLS_CA_PATH)

    /// Set the certificate chain
    /// Parameter type: Data; certificates
    public static let tlsCertBytes = NetworkOption(rawValue: FDB_NET_OPTION_TLS_CERT_BYTES)

    /// Set the file from which to load the certificate chain
    /// Parameter type: String; file path
    public static let tlsCertPath = NetworkOption(rawValue: FDB_NET_OPTION_TLS_CERT_PATH)

    /// Set the private key corresponding to your own certificate
    /// Parameter type: Data; key
    public static let tlsKeyBytes = NetworkOption(rawValue: FDB_NET_OPTION_TLS_KEY_BYTES)

    /// Set the file from which to load the private key corresponding to your own certificate
    /// Parameter type: String; file path
    public static let tlsKeyPath = NetworkOption(rawValue: FDB_NET_OPTION_TLS_KEY_PATH)

    /// Set the passphrase for encrypted private key. Password should be set before setting the key for the password to be used.
    /// Parameter type: String; key passphrase
    public static let tlsPassword = NetworkOption(rawValue: FDB_NET_OPTION_TLS_PASSWORD)

    /// Parameter type: String; file path or linker-resolved name
    @available(*, deprecated) public static let tlsPlugin = NetworkOption(rawValue: FDB_NET_OPTION_TLS_PLUGIN)

    /// Set the peer certificate field verification criteria
    /// Parameter type: Data; verification pattern
    public static let tlsVerifyPeers = NetworkOption(rawValue: FDB_NET_OPTION_TLS_VERIFY_PEERS)

    /// If set, callbacks from external client libraries can be called from threads created by the FoundationDB client library. Otherwise, callbacks will be called from either the thread used to add the callback or the network thread. Setting this option can improve performance when connected using an external client, but may not be safe to use in all environments. Must be set before setting up the network. WARNING: This feature is considered experimental at this time.
    public static let callbacksOnExternalThreads = NetworkOption(rawValue: FDB_NET_OPTION_CALLBACKS_ON_EXTERNAL_THREADS)

    /// Disable client buggify
    public static let clientBuggifyDisable = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_BUGGIFY_DISABLE)

    /// Enable client buggify - will make requests randomly fail (intended for client testing)
    public static let clientBuggifyEnable = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_BUGGIFY_ENABLE)

    /// Set the probability of a CLIENT_BUGGIFY section being active for the current execution.
    /// Parameter type: Int; probability expressed as a percentage between 0 and 100
    public static let clientBuggifySectionActivatedProbability = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_BUGGIFY_SECTION_ACTIVATED_PROBABILITY)

    /// Set the probability of an active CLIENT_BUGGIFY section being fired. A section will only fire if it was activated
    /// Parameter type: Int; probability expressed as a percentage between 0 and 100
    public static let clientBuggifySectionFiredProbability = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_BUGGIFY_SECTION_FIRED_PROBABILITY)

    /// Spawns multiple worker threads for each version of the client that is loaded.  Setting this to a number greater than one implies disable_local_client.
    /// Parameter type: Int; Number of client threads to be spawned.  Each cluster will be serviced by a single client thread.
    public static let clientThreadsPerVersion = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_THREADS_PER_VERSION)

    /// Sets the directory for storing temporary files created by FDB client, such as temporary copies of client libraries. Defaults to /tmp
    /// Parameter type: String; Client directory for temporary files. 
    public static let clientTmpDir = NetworkOption(rawValue: FDB_NET_OPTION_CLIENT_TMP_DIR)

    /// Parameter type: String; path to cluster file
    @available(*, deprecated) public static let clusterFile = NetworkOption(rawValue: FDB_NET_OPTION_CLUSTER_FILE)

    /// Prevents the multi-version client API from being disabled, even if no external clients are configured. This option is required to use GRV caching.
    public static let disableClientBypass = NetworkOption(rawValue: FDB_NET_OPTION_DISABLE_CLIENT_BYPASS)

    /// Disables logging of client statistics, such as sampled transaction activity.
    public static let disableClientStatisticsLogging = NetworkOption(rawValue: FDB_NET_OPTION_DISABLE_CLIENT_STATISTICS_LOGGING)

    /// Prevents connections through the local client, allowing only connections through externally loaded client libraries.
    public static let disableLocalClient = NetworkOption(rawValue: FDB_NET_OPTION_DISABLE_LOCAL_CLIENT)

    /// Disables the multi-version client API and instead uses the local client directly. Must be set before setting up the network.
    public static let disableMultiVersionClientApi = NetworkOption(rawValue: FDB_NET_OPTION_DISABLE_MULTI_VERSION_CLIENT_API)

    /// Set a tracer to run on the client. Should be set to the same value as the tracer set on the server.
    /// Parameter type: String; Distributed tracer type. Choose from none, log_file, or network_lossy
    public static let distributedClientTracer = NetworkOption(rawValue: FDB_NET_OPTION_DISTRIBUTED_CLIENT_TRACER)

    /// Enables debugging feature to perform run loop profiling. Requires trace logging to be enabled. WARNING: this feature is not recommended for use in production.
    public static let enableRunLoopProfiling = NetworkOption(rawValue: FDB_NET_OPTION_ENABLE_RUN_LOOP_PROFILING)

    @available(*, deprecated) public static let enableSlowTaskProfiling = NetworkOption(rawValue: FDB_NET_OPTION_ENABLE_SLOW_TASK_PROFILING)

    /// This option is set automatically on all clients loaded externally using the multi-version API.
    public static let externalClient = NetworkOption(rawValue: FDB_NET_OPTION_EXTERNAL_CLIENT)

    /// Searches the specified path for dynamic libraries and adds them to the list of client libraries for use by the multi-version client API. Must be set before setting up the network.
    /// Parameter type: String; path to directory containing client libraries
    public static let externalClientDirectory = NetworkOption(rawValue: FDB_NET_OPTION_EXTERNAL_CLIENT_DIRECTORY)

    /// Adds an external client library for use by the multi-version client API. Must be set before setting up the network.
    /// Parameter type: String; path to client library
    public static let externalClientLibrary = NetworkOption(rawValue: FDB_NET_OPTION_EXTERNAL_CLIENT_LIBRARY)

    /// This option tells a child on a multiversion client what transport ID to use.
    /// Parameter type: Int; Transport ID for the child connection
    public static let externalClientTransportId = NetworkOption(rawValue: FDB_NET_OPTION_EXTERNAL_CLIENT_TRANSPORT_ID)

    /// Fail with an error if there is no client matching the server version the client is connecting to
    public static let failIncompatibleClient = NetworkOption(rawValue: FDB_NET_OPTION_FAIL_INCOMPATIBLE_CLIENT)

    /// Adds an external client library to be used with a future version protocol. This option can be used testing purposes only!
    /// Parameter type: String; path to client library
    public static let futureVersionClientLibrary = NetworkOption(rawValue: FDB_NET_OPTION_FUTURE_VERSION_CLIENT_LIBRARY)

    /// Ignore the failure to initialize some of the external clients
    public static let ignoreExternalClientFailures = NetworkOption(rawValue: FDB_NET_OPTION_IGNORE_EXTERNAL_CLIENT_FAILURES)

    /// Set internal tuning or debugging knobs
    /// Parameter type: String; knob_name=knob_value
    public static let knob = NetworkOption(rawValue: FDB_NET_OPTION_KNOB)

    /// Parameter type: String; IP:PORT
    @available(*, deprecated) public static let localAddress = NetworkOption(rawValue: FDB_NET_OPTION_LOCAL_ADDRESS)

    /// Retain temporary external client library copies that are created for enabling multi-threading.
    public static let retainClientLibraryCopies = NetworkOption(rawValue: FDB_NET_OPTION_RETAIN_CLIENT_LIBRARY_COPIES)

    /// This option is set automatically to communicate the list of supported clients to the active client.
    /// Parameter type: String; [release version],[source version],[protocol version];...
    public static let supportedClientVersions = NetworkOption(rawValue: FDB_NET_OPTION_SUPPORTED_CLIENT_VERSIONS)

    /// Select clock source for trace files. now (the default) or realtime are supported.
    /// Parameter type: String; Trace clock source
    public static let traceClockSource = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_CLOCK_SOURCE)

    /// Enables trace output to a file in a directory of the clients choosing
    /// Parameter type: String; path to output directory (or NULL for current working directory)
    public static let traceEnable = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_ENABLE)

    /// Once provided, this string will be used to replace the port/PID in the log file names.
    /// Parameter type: String; The identifier that will be part of all trace file names
    public static let traceFileIdentifier = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_FILE_IDENTIFIER)

    /// Select the format of the log files. xml (the default) and json are supported.
    /// Parameter type: String; Format of trace files
    public static let traceFormat = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_FORMAT)

    /// Initialize trace files on network setup, determine the local IP later. Otherwise tracing is initialized when opening the first database.
    public static let traceInitializeOnSetup = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_INITIALIZE_ON_SETUP)

    /// Sets the 'LogGroup' attribute with the specified value for all events in the trace output files. The default log group is 'default'.
    /// Parameter type: String; value of the LogGroup attribute
    public static let traceLogGroup = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_LOG_GROUP)

    /// Sets the maximum size of all the trace output files put together. This value should be in the range ``[0, INT64_MAX]``. If the value is set to 0, there is no limit on the total size of the files. The default is a maximum size of 104,857,600 bytes. If the default roll size is used, this means that a maximum of 10 trace files will be written at a time.
    /// Parameter type: Int; max total size of trace files
    public static let traceMaxLogsSize = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_MAX_LOGS_SIZE)

    /// Set file suffix for partially written log files.
    /// Parameter type: String; Append this suffix to partially written log files. When a log file is complete, it is renamed to remove the suffix. No separator is added between the file and the suffix. If you want to add a file extension, you should include the separator - e.g. '.tmp' instead of 'tmp' to add the 'tmp' extension.
    public static let tracePartialFileSuffix = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_PARTIAL_FILE_SUFFIX)

    /// Sets the maximum size in bytes of a single trace output file. This value should be in the range ``[0, INT64_MAX]``. If the value is set to 0, there is no limit on individual file size. The default is a maximum size of 10,485,760 bytes.
    /// Parameter type: Int; max size of a single trace output file
    public static let traceRollSize = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_ROLL_SIZE)

    /// Use the same base trace file name for all client threads as it did before version 7.2. The current default behavior is to use distinct trace file names for client threads by including their version and thread index.
    public static let traceShareAmongClientThreads = NetworkOption(rawValue: FDB_NET_OPTION_TRACE_SHARE_AMONG_CLIENT_THREADS)
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// swift-mode:basic-offset: 4
// End:
