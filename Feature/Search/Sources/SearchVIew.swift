//
//  SearchVIew.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI

struct SearchView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var store: SearchStore
  @Binding var timezone: Timezone?

  var body: some View {
    List(store.suggestions) { row in
      SuggestionView(timezone: row)
        .onTapGesture(perform: {
          timezone = row
          dismiss()
        })
    }
    .searchable(
      text: $store.text,
      placement: .navigationBarDrawer,
      prompt: "Search"
    )
    .onSubmit(of: .search) {
      endEditing()
      dismiss()
    }
    .onAppear(perform: {

    })
  }
}

fileprivate struct SuggestionView: View {
  var timezone: Timezone

  var body: some View {
    VStack(alignment: .leading) {
      Text(timezone.city)
        .font(.subheadline)
        .foregroundStyle(.white)
      Text(timezone.nation)
        .font(.caption.bold())
        .foregroundStyle(.white)
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
