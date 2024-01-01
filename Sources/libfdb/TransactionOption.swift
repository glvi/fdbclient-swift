// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: A2032FEE-C1AC-4AB1-A9D8-8894AB8513AA

import Clibfdb
import Foundation

public struct TransactionOption: RawRepresentable {
  public var rawValue: FDBTransactionOption
  public init(rawValue: FDBTransactionOption) {
    self.rawValue = rawValue
  }
} // TransactionOption

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
