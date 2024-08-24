//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let project = Project(
  name: "Domain",
  targets: [
    .target(
      name: "Domain",
      destinations: .iOS,
      product: .staticFramework,
      bundleId: "domain.framework",
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "DomainWeather", path: "Weather"),
        .project(target: "DomainSearch", path: "Search"),
      ]
    )
  ]
)
