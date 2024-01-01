// -*- mode: swift; coding: utf-8-unix; -*- vi:ai:et:sw=2
//
// Package: 
//
// © 2023 GLVI Gesellschaft für Luftverkehrsinformatik mbH, Hamburg, DE
// ALL RIGHTS RESERVED.
//
// Author(s): Kai Lothar John
//
// UUID: 111D2207-3991-4EA1-BCFD-5D5C838B3FFF

import Clibfdb
import Foundation

public struct NetworkOption: RawRepresentable {
  public typealias RawValue = FDBNetworkOption
  public var rawValue: RawValue
  public init(rawValue: RawValue) {
    self.rawValue = rawValue
  }
} // NetworkOption


extension NetworkOption {
  private static func mkopt(_ option: NetworkOption.RawValue) -> NetworkOption {
    NetworkOption(rawValue: option)
  }
}

// End of file

// Local Variables:
// indent-tabs-mode: nil
// End:
