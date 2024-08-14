import SwiftUI

@main
struct WeatherAppApp: App {
  @StateObject var searchStore = SearchStore(
    searchUseCase: DefaultSearchTimezoneUsecase(
      repository: SearchRepositoryImpl())
  )

  var body: some Scene {
    let repository = DefaultWeatherRepository()
    let useCase = DefaultCurrentWeatherUseCase(repository: repository)
    let mainStore = MainStore(useCase: useCase, timezone: .default)

    WindowGroup {
      ContentView(
        store: mainStore,
        searchStore: searchStore
      )
      .task {
        searchStore.prefetch()
      }
    }
  }
}
