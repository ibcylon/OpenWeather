import SwiftUI

public enum WeatherScene: Hashable {
    case root
    case search
}

public struct ContentView: View {
  @bindingstate
  @State var model: Weather.CurrentWeatherEntity = .init(
    titleModel: .init(
      timezone: "Asia/Seoul",
      temparature: 25,
      description: "Clear Sky",
      maxTemparature: 30,
      minTemparature: 20),
    coordinate: .init(latitude: 37.5665, longitude: 126.9780),
    humidity: 0,
    cloudy: 0,
    windSpeed: 1.2
  )

  public init() {

  }

  public var body: some View {
    NavigationStack(path: <#T##Binding<NavigationPath>#>) {
      GeometryReader { proxy in
        let topEdge = proxy.safeAreaInsets.top
        VStack {
          HomeView(model: model, topEdge: topEdge)
            .ignoresSafeArea(.all, edges: .top)
        }
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
