//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation

struct WeatherEndPointBuilder {
  static func currentEndPoint(timezone: Timezone) -> WeatherEndpoint<WeatherResponse> {
    WeatherEndpoint (path: "onecall", httpMethod: .get, queryParameters: timezone.toDTO())
  }
}
