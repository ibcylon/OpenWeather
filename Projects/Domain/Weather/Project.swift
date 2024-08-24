//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let name = "DomainWeather"
let bundleName = "domain.weather."

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
        .project(target: "DomainSearchInterface", path: "../Search"),
      ]
    ),
    .target(
      name: name,
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName,
      sources: ["Sources/**"],
      dependencies: [
        .target(name: name + "Interface"),
      ]
    )
  ]
)
