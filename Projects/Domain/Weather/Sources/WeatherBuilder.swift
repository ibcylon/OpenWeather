//
//  WeatherClient.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import DomainSearchInterface
import DomainWeatherInterface
import Core

struct WeatherEndPointBuilder {
  static func currentEndPoint(timezone: Timezone) -> WeatherEndpoint<WeatherResponse> {
    WeatherEndpoint(path: "onecall", httpMethod: .get, queryParameters: timezone.toDTO())
  }
}
