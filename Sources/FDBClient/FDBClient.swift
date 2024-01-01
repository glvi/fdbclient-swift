import libfdb
import Foundation

public struct FDB {
  public private(set) static var selectedApi: Int = 0
}

extension FDB {

  public static func selectApi<T: BinaryInteger>(version: T) throws {
    guard selectedApi == 0 else {return}
    selectedApi = Int(try Api.select(version: version))
  }

} // FDB
