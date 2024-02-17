//
//  LaunchScreen.swift
//  App
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI
import RootFeature
import ComposableArchitecture

@main
struct LaunchScreen: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
      
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: RootFeature.State()) {
                RootFeature()._printChanges()
            })
        }
    }
}
