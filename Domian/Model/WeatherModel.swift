//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

enum Weather {
  struct CurrentWeatherEntity: Identifiable {
    var id = UUID().uuidString

    let titleModel: TitleModel
    let coordinate: Coordinate2D
    let dailyForecast: [DailyForecast] = Weather.DailyForecast.mock
    let hourlyForecast: [HourlyForecast] = Weather.HourlyForecast.mock

    let humidity: Double
    let cloudy: Double
    let windSpeed: Double
  }

  struct Coordinate2D {
    var latitude: Double
    var longitude: Double
  }

  struct TitleModel {
    var timezone: String
    var temparature: Int
    var description: String
    var maxTemparature: Int
    var minTemparature: Int
  }
}

