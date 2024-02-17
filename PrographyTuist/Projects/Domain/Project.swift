//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//  Copyright © 2024 QCells. All rights reserved.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Domain",
    platform: .iOS,
    product: .framework
)
