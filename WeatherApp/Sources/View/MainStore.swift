//
//  MainStore.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import Combine

@MainActor
final class MainStore: ObservableObject {
  @Published var timezone: Timezone
  @Published var weather: Weather.CurrentWeatherEntity = .mock
  @Published var isSearching: Bool = false

  private var cancellables: Set<AnyCancellable> = []
  private let useCase: CurrentWeatherUseCase

  init(useCase: CurrentWeatherUseCase, timezone: Timezone) {
    self.useCase = useCase
    self.timezone = timezone

    bind()
  }

  func bind() {
    $timezone
      .removeDuplicates(by: { $0.id == $1.id })
      .sink { [weak self] timezone in
        guard let self = self else { return }
        fetchWeather(timezone: timezone)
      }
      .store(in: &cancellables)
  }

  private func fetchWeather(timezone: Timezone) {
    Task {
      self.weather = try await self.useCase.fetchWeather(timezone: timezone)
    }
  }
}

