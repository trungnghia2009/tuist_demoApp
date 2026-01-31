//
//  Environment.swift
//  Manifests
//
//  Created by Tran Trung Nghia on 31/1/26.
//

import ProjectDescription

enum AppEnvironment: String {
    case dev
    case qa
    case prod

    var configurationName: ConfigurationName {
        switch self {
        case .dev: return "Debug-Dev"
        case .qa: return "Debug-QA"
        case .prod: return "Release-Prod"
        }
    }

    var schemeName: String {
        switch self {
        case .dev: return "MyApp-Dev"
        case .qa: return "MyApp-QA"
        case .prod: return "MyApp"
        }
    }
}
