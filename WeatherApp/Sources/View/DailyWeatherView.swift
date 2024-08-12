//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import SwiftUI

struct DailyWeatherView: View {
  var model: Weather.CurrentWeatherEntity

  var body: some View {
    VStack(spacing: 10) {
      CustomStackView {
        Label {
          Text("Hourly Forecast")
        } icon: {
          Image(systemName: "clock")
        }
      } contentView: {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHGrid(rows: [GridItem(.flexible())], spacing: 15) {
            ForEach(model.hourlyForecast) { hourly in
              ForecastView(model: hourly)
            }
          }
        }
      }

      CustomStackView {
        Label {
          Text("Daily Forecast")
        } icon: {
          Image(systemName: "calendar")
        }
      } contentView: {
        VStack(alignment: .leading, spacing: 10) {
          ForEach(model.dailyForecast) { daily in
            DailyForecastView(cast: daily)
          }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
      }

      CustomStackView {
        Label {
          Text("Map View")
        } icon: {
          Image(systemName: "map")
        }
      } contentView: {
        VStack {
          MapView(coordinate: model.coordinate)
              .frame(height: 300)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
      }

      HStack {
        CustomStackView {
          Label {
            Text("Humidity")
          } icon: {
            Image(systemName: "humidity.fill")
          }
        } contentView: {
          VStack(alignment: .leading, spacing: 10) {

            Text("\(Int(model.humidity))")
              .font(.title)
              .fontWeight(.semibold)

            Text("Low")
              .font(.title)
              .fontWeight(.semibold)
          }
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity, alignment: .leading)
        }

        CustomStackView {
          Label {
            Text("Cloudy")
          } icon: {
            Image(systemName: "cloud.fog")
          }
        } contentView: {
          VStack(alignment: .leading, spacing: 10) {

            Text("\(Int(model.cloudy))")
              .font(.title)
              .fontWeight(.semibold)

            Text("Low")
              .font(.title)
              .fontWeight(.semibold)
          }
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      HStack {
        CustomStackView {
          Label {
            Text("Wind Speed")
          } icon: {
            Image(systemName: "wind")
          }
        } contentView: {
          VStack(alignment: .leading, spacing: 10) {

            Text("\(Int(model.windSpeed))")
              .font(.title)
              .fontWeight(.semibold)

            Text("Low")
              .font(.title)
              .fontWeight(.semibold)
          }
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity, alignment: .leading)
        }

        CustomStackView {
          Label {
            Text("Air Quality")
          } icon: {
            Image(systemName: "sun.min")
          }
        } contentView: {
          VStack(alignment: .leading, spacing: 10) {

            Text("0")
              .font(.title)
              .fontWeight(.semibold)

            Text("Low")
              .font(.title)
              .fontWeight(.semibold)
          }
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
