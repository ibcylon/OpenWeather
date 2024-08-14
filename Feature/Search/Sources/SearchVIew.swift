//
//  SearchVIew.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var store: SearchStore
  @Binding var timezone: Timezone
  @Binding var isSearching: Bool

  var body: some View {
    List(store.suggestions) { row in
        SuggestionView(timezone: row) {
          timezone = row
          isSearching = false
        }
        .listRowBackground(Rectangle()
          .background(.thinMaterial)
          .preferredColorScheme(.dark)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .preferredColorScheme(.dark)
    .contentMargins(.vertical, 0) // https://forums.developer.apple.com/forums/thread/731446
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .searchable(
      text: $store.text,
      placement: .navigationBarDrawer(displayMode: .always),
      prompt: "Search"
    )
    .onSubmit(of: .search) {
      if let timezone = store.suggestions.first(where: { $0.city == store.text }) {
        self.timezone = timezone
      }
      endEditing()
      isSearching = false
    }
    .scrollContentBackground(.hidden)
    .background(LinearGradient(colors: [Color(.blue), Color(.purple)], startPoint: .topTrailing, endPoint: .bottomTrailing))
    .onAppear(perform: {
      UISearchBar.appearance().tintColor = .white
    })
  }
}

fileprivate struct SuggestionView: View {
  var timezone: Timezone
  var tapAction: () -> Void
  var body: some View {
    VStack(alignment: .leading) {
      Text(timezone.city)
        .font(.subheadline)
        .foregroundStyle(.white)
      Text(timezone.nation)
        .font(.caption.bold())
        .foregroundStyle(.white)
    }.onTapGesture {
      tapAction()
    }
  }
}

extension SearchView {
  private func endEditing() {
    UIApplication.shared.sendAction(
      #selector(UIResponder.resignFirstResponder),
      to: nil, from: nil, for: nil)
  }
}

#Preview {
  let searchStore = SearchStore(searchUseCase: DefaultSearchTimezoneUsecase(repository: SearchRepositoryImpl()))
  searchStore.suggestions = [
    .default,
    .init(id: 1, city: "Seoul", 
          nation: "Korea",
          coord: .init(latitude: 37.5665, longitude: 126.978)),
    .init(id: 1, city: "Seoul",
          nation: "Korea",
          coord: .init(latitude: 37.5665, longitude: 126.978))
  ]

  return SearchView(store: searchStore, timezone: .constant(.default), isSearching: .constant(true))
}
