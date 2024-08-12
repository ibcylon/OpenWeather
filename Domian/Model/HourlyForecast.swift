//
//  HourlyForecast.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

extension Weather {
  struct HourlyForecast: Identifiable {
    var id = UUID().uuidString

    var time: String
    var celcius: Double
    var image: String
  }
}

extension Weather.HourlyForecast {
  static var mock: [Weather.HourlyForecast] {
    [
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
      .init(time: "Now", celcius: 94, image: "sun.min"),
    ]
  }
}
