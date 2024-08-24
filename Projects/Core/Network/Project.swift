//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let project = Project(
  name: "CoreNetwork",
  targets: [
    .target(
      name: "CoreNetwork",
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: "core.network.framework",
      sources: ["Sources/**"],
      dependencies: [
        
      ]
    )
  ]
)
