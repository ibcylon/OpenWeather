//
//  TimezoneRequestDTO.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

struct Coordinate2DDTO: Codable {
  let latitude: Double
  let longitude: Double
  let units = "metric"
  let exclude = "minutely"

  enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lon"
    case units, exclude
  }
}

extension Timezone {
  func toDTO() -> Coordinate2DDTO {
    Coordinate2DDTO(latitude: coord.latitude, longitude: coord.longitude)
  }
}
