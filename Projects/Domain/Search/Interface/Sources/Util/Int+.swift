//
//  Int+.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

public extension DateFormatter {
  static let day: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter
  }()

  static let date: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter
  }()

  static let hour: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter
  }()
}

public extension Int {
  func toDay() -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    return Calendar.current.isDateInToday(date) ? "오늘" : DateFormatter.day.string(from: date)
  }

  func toHour() -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(self))
    if Calendar.current.isDateInToday(date) && Calendar.current.isDate(date, equalTo: Date(), toGranularity: .hour) {
      return "지금"
    }
    return DateFormatter.hour.string(from: date) + "시"
  }
}
