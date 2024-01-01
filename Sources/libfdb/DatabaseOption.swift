// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: EF853A48-4DB9-45DD-8397-31ED4D3DFB5E

import Clibfdb
import Foundation

public struct DatabaseOption: RawRepresentable {
  public typealias RawValue = FDBDatabaseOption
  public var rawValue: RawValue
  public init(rawValue: RawValue) {
    self.rawValue = rawValue
  }
} // DatabaseOption

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
