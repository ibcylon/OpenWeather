import SwiftUI

public enum WeatherScene: Hashable {
  case root
  case search
}

public struct ContentView: View {
  @StateObject var store: MainStore = .init(useCase: DefaultCurrentWeatherUseCase(repository: DefaultWeatherRepository()))
  @ObservedObject var searchStore: SearchStore

  public var body: some View {
    NavigationStack(path: $store.stackPaths) {
      ZStack {
        VStack {
          SearchButton()
            .onTapGesture {
              store.isSearching = true
            }
          HomeView(model: $store.weather, topEdge: 0)
        }
        .sheet(isPresented: $store.isSearching, onDismiss: {
          store.isSearching = false
        }) {
          NavigationStack {
            SearchView(
              store: searchStore,
              timezone: $store.timezone
            )
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(LinearGradient(colors: [Color(.blue), Color(.purple)], startPoint: .topTrailing, endPoint: .bottomTrailing))
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(searchStore: SearchStore())
  }
}
