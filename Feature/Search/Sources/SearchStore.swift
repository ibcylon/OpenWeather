//
//  SearchStore.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import Combine

@MainActor
final class SearchStore: ObservableObject {
  @Published var text: String = ""
  @Published var suggestions: [Timezone] = []

  var timezones: [Timezone] = []
  private var cancellables: Set<AnyCancellable> = []

  init() {
    Task(priority: .background, operation: {
      self.timezones = fetchLocations()
    })

    $text
      .removeDuplicates()
      .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
      .sink { [weak self] query in
        guard let self else { return }
        Task(priority: .userInitiated) {
          self.suggestions = await self.search(query, dataSource: self.timezones)
        }
      }.store(in: &cancellables)
  }

  func fetchLocations() -> [Timezone] {
    return Bundle.main.decode(
      [TimeZoneDTO].self,
      from: "Timezones.json")
    .map { $0.toDomain() }
  }

  private func search(_ query: String, dataSource: [Timezone]) async -> [Timezone] {
    guard !query.isEmpty else {
      return []
    }

    var query = query
      .lowercased()

    let replaceQuery = query.replacingOccurrences(of: " ", with: "")

    let result = dataSource
      .filter {
        let word = query.components(separatedBy: " ")[0]
        return $0.city.lowercased().prefix(word.count) == word
      }
      .filter {
        $0.city.lowercased()
          .replacingOccurrences(of: " ", with: "")
          .contains(replaceQuery)
      }

    return result
  }
}
