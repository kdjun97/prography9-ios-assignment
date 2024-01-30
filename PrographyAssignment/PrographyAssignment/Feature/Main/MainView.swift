//
//  MainView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainFeature>
    
    init(store: StoreOf<MainFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack{
            Text("Main View")
        }
    }
}
