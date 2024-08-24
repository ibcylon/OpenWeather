//
//  CustomStackView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import SwiftUI

public struct CustomStackView<Title: View, Content: View>: View {
  var title: Title
  var content: Content
  public init(@ViewBuilder titleView: @escaping () -> Title,
       @ViewBuilder contentView: @escaping () -> Content) {
    self.title = titleView()
    self.content = contentView()
  }
  public var body: some View {
    VStack {
      title
        .font(.callout)
        .lineLimit(1)
        .frame(height: 38)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
      Divider()
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.leading, .trailing, .bottom])

    }
    .background(.ultraThinMaterial, in:
                  CustomCorner(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 12))

    .preferredColorScheme(.dark)
  }
}
