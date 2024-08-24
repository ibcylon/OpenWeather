//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let project = Project(
  name: "DSkit",
  targets: [
    .target(
      name: "DSKit",
      destinations: .iOS,
      product: .staticFramework,
      bundleId: "dskit.framework",
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "Domain", path: "../../Domain"),
      ]
    )
  ]
)
