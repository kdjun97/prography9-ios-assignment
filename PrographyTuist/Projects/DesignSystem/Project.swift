//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DesignSystem",
    platform: .iOS,
    product: .framework,
    resources: ["Resources/**"]
)
