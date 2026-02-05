import ProjectDescription

private let appName = "DemoApp"
private let version = "0.1.0"
private let bundleVersion = "1"
private let iOSTargetVersion = "16.0"

private let schemeDev = "Debug-Dev"
private let schemeQA = "Release-QA"
private let schemeProd = "Release-Prod"

private let swiftPackagesPath = "SwiftPackages/"

let configurations: [Configuration] = [
    .debug(
        name: .configuration(schemeDev),
        xcconfig: .relativeToRoot("Configs/Dev.xcconfig")
    ),
    .release(
        name: .configuration(schemeQA),
        xcconfig: .relativeToRoot("Configs/QA.xcconfig")
    ),
    .release(
        name: .configuration(schemeProd),
        xcconfig: .relativeToRoot("Configs/Prod.xcconfig")
    )
]

let settings = Settings.settings(
    configurations: configurations
)

let schemes: [Scheme] = [
    .scheme(
        name: "DemoApp-Dev",
        shared: true,
        buildAction: .buildAction(targets: [.target(appName)]),
        runAction: .runAction(configuration: .configuration(schemeDev)),
        archiveAction: .archiveAction(configuration: .configuration(schemeDev)),
    ),
    .scheme(
        name: "DemoApp-QA",
        shared: true,
        buildAction: .buildAction(targets: [.target(appName)]),
        runAction: .runAction(configuration: .configuration(schemeQA)),
        archiveAction: .archiveAction(configuration: .configuration(schemeQA)),
    ),
    .scheme(
        name: "DemoApp",
        shared: true,
        buildAction: .buildAction(targets: [.target(appName)]),
        runAction: .runAction(configuration: .configuration(schemeProd)),
        archiveAction: .archiveAction(configuration: .configuration(schemeProd)),
    )
]

let project = Project(
    name: appName,
    packages: [
        .remote(
            url: "https://github.com/Alamofire/Alamofire.git",
            requirement: .exact("5.11.0")
        ),
        .package(path: "\(swiftPackagesPath)UIComponents"),
    ],
    settings: settings,
    targets: [
        .target(
            name: appName,
            destinations: .iOS,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS(iOSTargetVersion),
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "$(APP_DISPLAY_NAME)",
                    "API_BASE_URL": "$(API_BASE_URL)",
                    "UILaunchScreen": [],
                    "UISupportedInterfaceOrientations":
                        [
                            "UIInterfaceOrientationPortrait",
                        ],
                    "CFBundleShortVersionString": "\(version)",
                    "CFBundleVersion": "\(bundleVersion)",
                    "UILaunchStoryboardName": "LaunchScreen",
                ]
            ),
            resources: [
                "Resources/**",
            ],
            buildableFolders: [
                "DemoApp/Sources",
                "DemoApp/Resources",
            ],
            dependencies: [
                .package(product: "Alamofire"),
                .package(product: "UIComponents"),
            ],
        ),
        .target(
            name: "DemoAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.DemoAppTests",
            infoPlist: .default,
            buildableFolders: [
                "DemoApp/Tests"
            ],
            dependencies: [.target(name: "DemoApp")]
        ),
    ],
    schemes: schemes
)
