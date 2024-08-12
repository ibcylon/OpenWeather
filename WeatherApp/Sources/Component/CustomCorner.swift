//
//  CustomCorner.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import Foundation
import SwiftUI

struct CustomCorner: Shape {
  var corners: UIRectCorner
  var radius: CGFloat

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

    return Path(path.cgPath)
  }
}
