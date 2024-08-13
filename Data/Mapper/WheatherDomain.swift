//
//  WheatherDomain.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

extension WeatherResponse.Daily {
  func toDomain() -> Weather.DailyForecast {
    .init(day: dt.toDay(), maxCelcius: temp.max, minCelcius: temp.min, image: weather[0].icon.replacingOccurrences(of: "n", with: "d"))
  }
}

extension WeatherResponse.Current {
  func toDomain() -> Weather.HourlyForecast {
    .init(time: dt.toHour(), celcius: temp, image: weather[0].icon.replacingOccurrences(of: "n", with: "d"))
  }
}

extension WeatherResponse {
  public func toDomain() -> Weather.CurrentWeatherEntity {
    .init(
      titleModel: .init(
        timezone: timezone,
        temparature: Int(current.temp),
        description: current.weather[0].description,
        maxTemparature: Int(daily[0].temp.max),
        minTemparature: Int(daily[0].temp.min)),
      coordinate: .init(latitude: lat, longitude: lon),
      dailyForecast: Array(daily.map { $0.toDomain() }.prefix(5)),
      hourlyForecast: hourly
        .filter { item in
          let current = hourly[0].dt
          return (item.dt - current).isMultiple(of: 3600 * 3)
        }
        .map { $0.toDomain() },
      humidity: current.humidity,
      cloudy: current.clouds,
      windSpeed: current.windSpeed
    )
  }
}
