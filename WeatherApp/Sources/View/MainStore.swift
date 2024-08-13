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
  @Published var timezone: Timezone?
  @Published var weather: Weather.CurrentWeatherEntity = .mock
  @Published var isSearching: Bool = false
  @Published var stackPaths: [WeatherScene] = []

  private var cancellables: Set<AnyCancellable> = []
  private let useCase: CurrentWeatherUseCase

  init(useCase: CurrentWeatherUseCase) {
    self.useCase = useCase

    fetchWeather()
  }

  func fetchWeather() {
    $timezone
      .map { $0 ?? .default }
      .receive(on: DispatchQueue.main)
      .sink { [weak self] timezone in
        guard let self = self else { return }
        Task {
          self.weather = try await self.useCase.fetchWeather(timezone: timezone)
        }
      }
      .store(in: &cancellables)
  }
}
