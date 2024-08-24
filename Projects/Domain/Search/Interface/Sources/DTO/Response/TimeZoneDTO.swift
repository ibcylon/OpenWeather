//
//  TimeZoneDTO.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import DomainSearchInterface

// MARK: - TimeZoneElement
public struct TimeZoneDTO: Codable {
    public let id: Int
    public let name, country: String
    public let coord: Coord
  // MARK: - Coord
  public struct Coord: Codable {
    public let lon, lat: Double
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
