//
//  CurrentWeatherUseCase.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

public protocol CurrentWeatherUseCase {
  func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity
}

public final class DefaultCurrentWeatherUseCase {
  let repository: WeatherRepository

  init(repository: WeatherRepository) {
    self.repository = repository
  }
}

extension DefaultCurrentWeatherUseCase: CurrentWeatherUseCase {
  public func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity {
    try await repository.fetchWeather(timezone: timezone)
  }
}
