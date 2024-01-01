// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: fdbclient-swift
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 964E411E-B0AC-4EE7-9A7B-A9D6AFB27AB4

import Clibfdb
import Foundation

public enum Api {
  public static func select<T: BinaryInteger>(version: T) throws -> T {
    try selectApi(version: version)
  }
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
