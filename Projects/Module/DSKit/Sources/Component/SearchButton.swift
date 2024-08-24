//
//  SearchButton.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import SwiftUI

public struct SearchButton: View {
  var tapAction: () -> Void

  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 30)
        .background(.ultraThinMaterial, in: .capsule)
      HStack {
        Image(systemName: "magnifyingglass")
          .resizable()
          .frame(width: 20, height: 20)
          .padding(.all, 10)
        Text("Search")
        Spacer()
      }.foregroundStyle(.gray)
    }
    .frame(maxHeight: 40)
    .padding()
    .onTapGesture {
      tapAction()
    }
  }

  public init(tapAction: @escaping () -> Void) {
    self.tapAction = tapAction
  }
}
