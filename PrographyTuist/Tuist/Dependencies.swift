//
//  Dependencies.swift
//  Config
//
//  Created by 김동준 on 2/17/24
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: SwiftPackageManagerDependencies([
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.8.0"
        )
    ]),
    platforms: [.iOS]
)
