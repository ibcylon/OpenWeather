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
  public let coord: Weather.Coordinate2D
}

public extension Timezone {
  static let `default` = Timezone(
    id: 1839726,
    city: "Asan",
    nation: "KR",
    coord: .init(latitude: 36.783611, longitude: 127.004173))
}
