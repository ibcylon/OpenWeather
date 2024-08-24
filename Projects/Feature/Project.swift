//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let project = Project(
  name: "Feature",
  targets: [
    .target(
      name: "Feature",
      destinations: .iOS,
      product: .staticFramework,
      bundleId: "feature.framework",
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "FeatureWeather", path: "Weather"),
        .project(target: "FeatureSearch", path: "Search"),
      ]
    )
  ]
)
