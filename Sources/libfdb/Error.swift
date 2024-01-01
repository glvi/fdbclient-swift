// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: 
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 8617C327-7B66-4940-8E44-6FAC3D3A5001

import Clibfdb
import Foundation

public struct FDBError: Error {
  public let rawValue: fdb_error_t
  public init(_ rawValue: fdb_error_t) {
    self.rawValue = rawValue
  }
}

extension FDBError: CustomStringConvertible {
  public var description: String {
    if let ptr = fdb_get_error(rawValue) {
      let str = String(cString: ptr)
      return "FDBError: \(str) (\(rawValue))"
    } else {
      return "FDBError: (\(rawValue))"
    }
  }
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
