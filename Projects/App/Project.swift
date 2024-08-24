import ProjectDescription

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "WeatherApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.WeatherApp",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "Feature", path: "../Feature"),
            ]
        ),
        .target(
            name: "WeatherAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.WeatherAppTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "WeatherApp")]
        ),
    ]
)
