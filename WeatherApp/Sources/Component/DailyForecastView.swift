//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI

struct DailyForecastView: View {
  var cast: Weather.DailyForecast

  var body: some View {
    HStack {
      Text(cast.day)
        .font(.title2)
        .fontWeight(.semibold)
      Spacer()
      Image(systemName: cast.image)
        .font(.title2)
        .symbolVariant(.fill)
        .symbolRenderingMode(.palette)
        .foregroundStyle(.yellow, .white)
      Spacer()
      Text("max: \(Int(cast.celcius))°")
        .font(.caption)
        .fontWeight(.semibold)
      Text("min: \(Int(cast.celcius))°")
        .font(.caption)
        .fontWeight(.semibold)
    }
  }
}
