//
//  Forecast.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import Foundation

extension Weather {
  struct DailyForecast: Identifiable {
    var id = UUID().uuidString
    var day: String
    var celcius: Double
    var image: String
  }
}

extension Weather.DailyForecast {
  static var mock: [Weather.DailyForecast] {
    [
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
      .init(day: "Today", celcius: 94, image: "sun.min"),
    ]
  }
}
