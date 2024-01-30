//
//  PrographyAssignmentApp.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import SwiftUI
import ComposableArchitecture

@main
struct PrographyAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: RootFeature.State()) {
                RootFeature()._printChanges()
            })
        }
    }
}
