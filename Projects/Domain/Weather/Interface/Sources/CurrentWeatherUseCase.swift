//
//  CurrentWeatherUseCase.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import DomainSearchInterface

public protocol CurrentWeatherUseCase {
  func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity
}

public final class DefaultCurrentWeatherUseCase {
  let repository: WeatherRepository

  public init(repository: WeatherRepository) {
    self.repository = repository
  }
}

extension DefaultCurrentWeatherUseCase: CurrentWeatherUseCase {
  public func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity {
    try await repository.fetchWeather(timezone: timezone)
  }
}

final class MockCurrentWeatherUseCase: CurrentWeatherUseCase {
  func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity {
    return .mock
  }
}
