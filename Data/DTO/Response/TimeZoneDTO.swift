//
//  TimeZoneDTO.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

// MARK: - TimeZoneElement
struct TimeZoneDTO: Codable {
    let id: Int
    let name, country: String
    let coord: Coord
  // MARK: - Coord
  struct Coord: Codable {
    let lon, lat: Double
  }
}

extension TimeZoneDTO {
  func toDomain() -> Timezone {
    Timezone(
      id: id, city: name,
      nation: country,
      coord: .init(latitude: coord.lat.trim(6),
                   longitude: coord.lon.trim(6)))
  }
}

typealias TimeZoneDTOArray = [TimeZoneDTO]

extension Double {
  func trim(_ places: Int) -> Double {
    let digit: Double = pow(10, Double(places))
    return floor(self * digit) / digit
  }
}
