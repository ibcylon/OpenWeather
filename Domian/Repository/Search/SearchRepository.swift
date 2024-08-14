//
//  SearchRepository.swift
//  WeatherApp
//
//  Created by Kanghos on 8/14/24.
//

import Foundation

public protocol SearchRepository {
  func prefetchTimezone() async throws -> [Timezone]
  func searchTimezone(query: String, dataSource: [Timezone]) async throws -> [Timezone]
}
