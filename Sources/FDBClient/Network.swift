// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 12BB19E4-E493-492A-8F9D-566729516D9C

import libfdb
import Foundation

extension FDB {

  public static var network = Network()

  public actor Network {

    private typealias NetworkTask = Task<Void, Error>

    private enum State: Equatable {
      case initialized
      case setup
      case running(NetworkTask)
      case stopped
    }

    private var state: State = .initialized

    public var isRunning: Bool {
      switch state {
      case .running: true
      default: false
      }
    }

    public func setup() throws {
      switch state {
      case .initialized:
        try setupNetwork()
        state = .setup
      default:
        break // TODO: Log
      }
    }

    private func startNetworkRunner() throws -> Task<Void, Error> {
      Task {
        try runNetwork() // blocks indefinitely
      }
    }

    public func run() throws {
      switch state {
      case .setup:
        state = .running(try startNetworkRunner())
      default:
        break // TODO: Log
      }
    }

    public func stop() async throws {
      switch state {
      case .running(let runner):
        try stopNetwork()
        let _ = try await runner.value
        state = .stopped
      default:
        break // TODO: Log
      }
    }

    deinit {
      try? stopNetwork()
    }

  } // Network

}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
