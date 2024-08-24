//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import DomainSearchInterface

public protocol WeatherRepository {
  func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity
}
