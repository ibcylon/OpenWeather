import ProjectDescription

let project = Project(
    name: "WeatherApp",
    targets: [
        .target(
            name: "WeatherApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.WeatherApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["WeatherApp/Sources/**"],
            resources: ["WeatherApp/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "WeatherAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.WeatherAppTests",
            infoPlist: .default,
            sources: ["WeatherApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "WeatherApp")]
        ),
    ]
)
