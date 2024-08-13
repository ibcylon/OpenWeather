//
//  HomeView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import Foundation
import SwiftUI
import MapKit

struct HomeView: View {
  @State var offset: CGFloat = 0
  @Binding var model: Weather.CurrentWeatherEntity
  var topEdge: CGFloat

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        TitleView(model: model.titleModel)
        DailyWeatherView(model: model)
      }
      .padding(.top, topEdge)
      .padding([.horizontal, .bottom])
    }
  }
}

fileprivate struct TitleView: View {
  var model: Weather.TitleModel

  var body: some View {
    VStack {
      Text(model.timezone)
        .font(.system(size: 35))
        .foregroundColor(.white)
        .shadow(radius: 5)

      Text("\(model.temparature)°")
        .font(.system(size: 40, weight: .bold))
        .foregroundColor(.white)
        .shadow(radius: 5)
        .padding()

      Text(model.description)
        .foregroundStyle(.secondary)
        .shadow(radius: 5)

      Text("H: \(model.maxTemparature)° L: \(model.minTemparature)°")
        .font(.subheadline)
        .foregroundColor(.white)
        .fontWeight(.bold)
        .shadow(radius: 5)
    }
    .padding()
  }
}
