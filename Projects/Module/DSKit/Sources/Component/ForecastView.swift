//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI
import Domain

public struct ForecastView: View {
  var model: Weather.HourlyForecast

  public var body: some View {
    VStack(spacing: 15) {
      Text(model.time)
      Image(model.image)
        .resizable()
        .frame(width: 30, height: 30)
        .font(.title2)
//        .symbolVariant(.fill)
//        .symbolRenderingMode(.palette)
//        .foregroundStyle(.yellow, .white)
//        .frame(height: 30)

      Text("\(Int(model.celcius))°")
        .font(.callout.bold())
        .foregroundStyle(.white)
    }
    .padding(.horizontal, 10)
  }

  public init(model: Weather.HourlyForecast) {
    self.model = model
  }
}
