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
  private let searchUseCase: SearchTimezoneUseCase
  private var timezones: [Timezone] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var text: String = ""
  @Published var suggestions: [Timezone] = []

  init(searchUseCase: SearchTimezoneUseCase) {
    self.searchUseCase = searchUseCase

    bind()
  }

  func bind() {
    
    $text
      .filter { !$0.isEmpty }
      .removeDuplicates()
      .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
      .sink { [weak self] query in
        guard let self else { return }
        Task(priority: .userInitiated) {
          self.suggestions = try await self.searchUseCase.searchTimezone (query: query, dataSource: self.timezones)
        }
      }
      .store(in: &cancellables)
  }

  func prefetch() {
    Task(priority: .background, operation: {
      self.timezones = try await searchUseCase.prefetchTimezone()
    })
  }
}
