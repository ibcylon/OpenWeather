//
//  SearchTimezoneUseCase.swift
//  WeatherApp
//
//  Created by Kanghos on 8/14/24.
//

import Foundation

public protocol SearchTimezoneUseCase {
  func prefetchTimezone() async throws -> [Timezone]
  func searchTimezone(query: String, dataSource: [Timezone]) async throws -> [Timezone]
}

public final class DefaultSearchTimezoneUsecase {
  let repository: SearchRepository

  public init(repository: SearchRepository) {
    self.repository = repository
  }
}

extension DefaultSearchTimezoneUsecase: SearchTimezoneUseCase {
  public func prefetchTimezone() async throws -> [Timezone] {
    try await repository.prefetchTimezone()
  }

  public func searchTimezone(query: String, dataSource: [Timezone]) async throws -> [Timezone] {
    try await repository.searchTimezone(query: query, dataSource: dataSource)
  }
}
