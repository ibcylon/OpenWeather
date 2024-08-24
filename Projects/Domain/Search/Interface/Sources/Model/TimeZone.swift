//
//  TimeZone.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

public struct Timezone: Identifiable {
  public let id: Int
  public let city: String
  public let nation: String
  public let coord: Coordinate2D

  public struct Coordinate2D {
    public let latitude: Double
    public let longitude: Double

    public init(latitude: Double, longitude: Double) {
      self.latitude = latitude
      self.longitude = longitude
    }
  }

  public init(id: Int, city: String, nation: String, coord: Coordinate2D) {
    self.id = id
    self.city = city
    self.nation = nation
    self.coord = coord
  }
}

public extension Timezone {
  static let `default` = Timezone(
    id: 1839726,
    city: "Asan",
    nation: "KR",
    coord: .init(latitude: 36.783611, longitude: 127.004173))
}
