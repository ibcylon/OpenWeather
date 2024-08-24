//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let project = Project(
  name: "Core",
  targets: [
    .target(
      name: "Core",
      destinations: .iOS,
      product: .staticFramework,
      bundleId: "core.framework",
      sources: ["Sources/**"],
      dependencies: [
        .project(target: "CoreNetwork", path: "Network/"),
        .external(name: "ComposableArchitecture")
      ]
    )
  ]
)
