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

      HStack(alignment: .center) {
        Text(cast.day)
          .font(.title3)
          .fontWeight(.semibold)

        Spacer()

        Image(cast.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity, maxHeight: 30, alignment: .trailing)
          .padding(.trailing)

        Spacer()

          Text("max: " + String(format: "%3d°", Int(cast.maxCelcius)))
            .font(.caption)
            .fontWeight(.semibold)
        Text("min: " + String(format: "%3d°", Int(cast.minCelcius)))
            .font(.caption)
            .fontWeight(.semibold)

    }
  }
}
