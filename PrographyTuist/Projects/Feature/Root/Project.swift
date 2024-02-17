//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    platform: .iOS,
    product: .framework,
    dependencies: [
        .external(name: "ComposableArchitecture"),
        .project(target: "MainFeature", path: .relativeToRoot("Projects/Feature/Main")),
        .project(target: "RandomPhotoFeature", path: .relativeToRoot("Projects/Feature/RandomPhoto")),
        .project(target: "DetailFeature", path: .relativeToRoot("Projects/Feature/Detail"))
    ]
)
