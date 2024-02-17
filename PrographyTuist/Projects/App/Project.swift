//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .project(target: "RootFeature", path: .relativeToRoot("Projects/Feature/Root"))
    ],
    infoPlist: .file(path: "Support/Info.plist")
)
