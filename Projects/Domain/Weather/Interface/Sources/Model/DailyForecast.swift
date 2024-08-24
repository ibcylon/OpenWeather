//
//  Forecast.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import Foundation

public extension Weather {
  struct DailyForecast: Identifiable {
    public var id = UUID().uuidString
    public var day: String
    public var maxCelcius: Double
    public var minCelcius: Double
    public var image: String
  }
}

public extension Weather.DailyForecast {
  static var mock: [Weather.DailyForecast] {
    [
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
      .init(day: "Today", maxCelcius: 94, minCelcius: 94, image: "01d"),
    ]
  }
}
