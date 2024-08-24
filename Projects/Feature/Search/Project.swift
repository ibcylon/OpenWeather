//
//  Project.swift
//  WeatherAppManifests
//
//  Created by Kanghos on 8/24/24.
//

import Foundation
import ProjectDescription

let name = "FeatureSearch"
let bundleName = "feature.search."

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
        .project(target: "Domain", path: "../../Domain"),
      ]
    ),
    .target(
      name: name + "UI",
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName + "ui",
      sources: ["UI/Sources/**"],
      dependencies: [
        .target(name: name + "Interface"),
        .project(target: "DSKit", path: "../../Module/DSKit"),
      ]
    ),
    .target(
      name: name,
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName + "framework",
      sources: ["Sources/**"],
      dependencies: [
        .target(name: name + "UI"),
        .target(name: name + "Testing")
      ]
    ),
    .target(
      name: name + "Testing",
      destinations: .iOS,
      product: .staticLibrary,
      bundleId: bundleName + "testing",
      sources: ["Testing/Sources/**"],
      dependencies: [
        .target(name: name + "Interface"),
      ]
    ),
    .target(
      name: name + "Tests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: bundleName + "testing",
      sources: ["Tests/Sources/**"],
      dependencies: [
        .target(name: name),
      ]
    ),

    .target(
      name: name + "Demo",
      destinations: .iOS,
      product: .app,
      bundleId: bundleName + "demo",
      infoPlist: .extendingDefault(
          with: [
              "UILaunchScreen": [
                  "UIColorName": "",
                  "UIImageName": "",
              ],
          ]
      ),
      sources: ["Demo/Sources/**"],
      dependencies: [
        .target(name: name),
      ]
    )
  ]
)
