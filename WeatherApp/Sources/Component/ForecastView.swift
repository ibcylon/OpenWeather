//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI

struct ForecastView: View {
  var model: Weather.HourlyForecast

  var body: some View {
    VStack(spacing: 15) {
      Text(model.time)
      Image(systemName: model.image)
        .font(.title2)
        .symbolVariant(.fill)
        .symbolRenderingMode(.palette)
        .foregroundStyle(.yellow, .white)
        .frame(height: 30)

      Text("\(Int(model.celcius))°")
        .font(.callout.bold())
        .foregroundStyle(.white)
    }
    .padding(.horizontal, 10)
  }
}
