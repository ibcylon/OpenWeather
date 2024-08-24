//
//  CurrentWeatherResDTO.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

// MARK: - WeatherResponse
public struct WeatherResponse: Codable {
    public let lat, lon: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let current: Current
//    public let minutely: [Minutely]
    public let hourly: [Current]
    public let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }

  // MARK: - Current
  public struct Current: Codable {
    public let dt: Int
    public let sunrise, sunset: Int?
    public let temp, feelsLike: Double
    public let pressure, humidity: Int
    public let dewPoint, uvi: Double
    public let clouds, visibility: Int
    public let windSpeed: Double
    public let windDeg: Int
    public let weather: [WeatherItem]
    public let windGust, pop: Double?

    enum CodingKeys: String, CodingKey {
      case dt, sunrise, sunset, temp
      case feelsLike = "feels_like"
      case pressure, humidity
      case dewPoint = "dew_point"
      case uvi, clouds, visibility
      case windSpeed = "wind_speed"
      case windDeg = "wind_deg"
      case weather
      case windGust = "wind_gust"
      case pop
    }
  }

  // MARK: - Weather
  public struct WeatherItem: Codable {
    public let id: Int
    public let main: Main
    public let description: String
    public let icon: String
  }

  public enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
  }

  // MARK: - Daily
  public struct Daily: Codable {
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let summary: String
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherItem]
    let clouds: Int
    let pop, uvi: Double
    let rain: Double?

    enum CodingKeys: String, CodingKey {
      case dt, sunrise, sunset, moonrise, moonset
      case moonPhase = "moon_phase"
      case summary, temp
      case feelsLike = "feels_like"
      case pressure, humidity
      case dewPoint = "dew_point"
      case windSpeed = "wind_speed"
      case windDeg = "wind_deg"
      case windGust = "wind_gust"
      case weather, clouds, pop, uvi, rain
    }
  }

  // MARK: - FeelsLike
  public struct FeelsLike: Codable {
    let day, night, eve, morn: Double
  }

  // MARK: - Temp
  public struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
  }

  // MARK: - Minutely
  public struct Minutely: Codable {
    let dt, precipitation: Int
  }
}
