import SwiftUI

public enum WeatherScene: Hashable {
  case root
  case search
}

public struct ContentView: View {
  @StateObject var store: MainStore
  @ObservedObject var searchStore: SearchStore

  public var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          SearchButton {
            store.isSearching = true
          }
          HomeView(model: store.weather, topEdge: 0)
        }
        .fullScreenCover(isPresented: $store.isSearching) {
          NavigationStack {
            SearchView(
              store: searchStore,
              timezone: $store.timezone,
              isSearching: $store.isSearching
            )
            .toolbar {
              ToolbarItem(placement: .cancellationAction) {
                Button("Close") {
                  store.isSearching = false
                }
                .tint(.white)
              }
            }
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(LinearGradient(colors: [Color(.blue), Color(.purple)], startPoint: .topTrailing, endPoint: .bottomTrailing))
    }
  }
}


#Preview {
  let searchStore = SearchStore(searchUseCase: DefaultSearchTimezoneUsecase(repository: SearchRepositoryImpl()))
  searchStore.suggestions = [.default]
  return ContentView(store: MainStore(
    useCase: MockCurrentWeatherUseCase(),
    timezone: .default), searchStore: searchStore)
}
