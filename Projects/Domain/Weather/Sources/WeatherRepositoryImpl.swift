//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import DomainSearchInterface
import DomainWeatherInterface
import Core

public final class DefaultWeatherRepository {
  public init() { }
}

extension DefaultWeatherRepository: WeatherRepository {
  public func fetchWeather(timezone: Timezone) async throws -> Weather.CurrentWeatherEntity {
    let endPoint = WeatherEndPointBuilder.currentEndPoint(timezone: timezone)
    let response = try await NetworkProvider.shared.sendRequest(endPoint)

    return response.toDomain()
  }
}
