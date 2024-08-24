//
//  SearchRepositoryImpl.swift
//  WeatherApp
//
//  Created by Kanghos on 8/14/24.
//

import Foundation
import DomainSearchInterface

public final class SearchRepositoryImpl {
  public init() {}

}

extension SearchRepositoryImpl: SearchRepository {

  // TODO: 개선하기
  // Paging, sqlite 이용,
  // Full text Search
  // 자료구조 및 알고리즘 이용
  public func prefetchTimezone() async throws -> [Timezone] {
    Bundle.main.decode([TimeZoneDTO].self, from: "Timezones.json")
    .map { $0.toDomain() }
  }

  public func searchTimezone(query: String, dataSource: [Timezone]) async throws -> [Timezone] {
    guard !query.isEmpty else {
      return []
    }

    let query = query
      .lowercased()

    let replaceQuery = query.replacingOccurrences(of: " ", with: "")

    let result = dataSource
      .filter {
        let word = query.components(separatedBy: " ")[0]
        return $0.city
          .replacingOccurrences(of: " ", with: "")
          .lowercased()
          .prefix(word.count)
          .localizedStandardContains(word)
      }
      .filter {
        $0.city.lowercased()
          .replacingOccurrences(of: " ", with: "")
          .localizedStandardContains(replaceQuery)
      }

    return result
  }
}
