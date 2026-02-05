import ProjectDescription

// MARK: - General Settings
private let appName = "DemoApp"
private let version = "0.1.0"
private let bundleVersion = "1"
private let iOSTargetVersion = "16.0"
private let swiftPackagesPath = "SwiftPackages/"

// MARK: - Scheme Names
private let debugSchemeDev = "Debug-Dev"
private let debugSchemeQA = "Debug-QA"
private let debugSchemeProd = "Debug-Prod"
private let releaseSchemeDev = "Release-Dev"
private let releaseSchemeQA = "Release-QA"
private let releaseSchemeProd = "Release-Prod"

// MARK: - Settings
private let environmentNames = ["Dev",  "QA", "Prod"]
private let configurations: [Configuration] = environmentNames.flatMap { env in
    [
        .debug(
            name: .configuration("Debug-\(env)"),
            xcconfig: .relativeToRoot("Configs/\(env).xcconfig")
        ),
        .release(
            name: .configuration("Release-\(env)"),
            xcconfig: .relativeToRoot("Configs/\(env).xcconfig")
        )
    ]
}

private let settings = Settings.settings(
    configurations: configurations
)

// MARK: - Schemes
private let schemes: [Scheme] = [
    createSchme(debugSchemeDev),
    createSchme(releaseSchemeDev),
    createSchme(debugSchemeQA),
    createSchme(releaseSchemeQA),
    createSchme(debugSchemeProd),
    createSchme(releaseSchemeProd),
]

private func createSchme(_ configurationName: String) -> Scheme {
    return .scheme(
        name: configurationName,
        shared: true,
        buildAction: .buildAction(targets: [.target(appName)]),
        runAction: .runAction(configuration: .configuration(configurationName)),
        archiveAction: .archiveAction(configuration: .configuration(configurationName)),
    )
}

// MARK: - Project
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
            additionalFiles: [
                "README.md",
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
