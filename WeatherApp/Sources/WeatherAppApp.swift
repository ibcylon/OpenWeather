import SwiftUI

@main
struct WeatherAppApp: App {
  @StateObject var searchStore = SearchStore()
  var body: some Scene {
    WindowGroup {
      ContentView(searchStore: searchStore)
    }
  }
}
