//
//  HourlyForecast.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

public extension Weather {
  struct HourlyForecast: Identifiable {
    public var id = UUID().uuidString
    public var time: String
    public var celcius: Double
    public var image: String
  }
}

public extension Weather.HourlyForecast {
  static var mock: [Weather.HourlyForecast] {
    [
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
      .init(time: "Now", celcius: 94, image: "01d"),
    ]
  }
}
