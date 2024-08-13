//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

public enum Weather {
  public struct CurrentWeatherEntity: Identifiable {
    public var id = UUID().uuidString
    public let titleModel: TitleModel
    public let coordinate: Coordinate2D
    public let dailyForecast: [DailyForecast]
    public let hourlyForecast: [HourlyForecast]

    public let humidity: Int
    public let cloudy: Int
    public let windSpeed: Double
  }

  public struct Coordinate2D {
    public let latitude: Double
    public let longitude: Double
  }

  public struct TitleModel {
    public let timezone: String
    public let temparature: Int
    public let description: String
    public let maxTemparature: Int
    public let minTemparature: Int
  }
}

public extension Weather.CurrentWeatherEntity {
  static var mock: Self = .init(
    titleModel: .init(
      timezone: "Asia/Seoul",
      temparature: 25,
      description: "Clear Sky",
      maxTemparature: 30,
      minTemparature: 20),
    coordinate: .init(latitude: 37.5665, longitude: 126.9780),
    dailyForecast: Weather.DailyForecast.mock,
    hourlyForecast: Weather.HourlyForecast.mock,
    humidity: 0,
    cloudy: 0,
    windSpeed: 1.2
  )
}
