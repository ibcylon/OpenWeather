//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let name = "DomainSearch"
let bundleName = "domain.search."

let project = Project(
  name: name,
  targets: [
    .target(
      name: name + "Interface",
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName + "interface",
      sources: ["Interface/Sources/**"],
      dependencies: [
        .project(target: "Core", path: "../../Core"),
      ]
    ),
    .target(
      name: name,
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .target(name: name + "Interface"),
      ]
    )
  ]
)
