//
//  DetailView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/30/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct DetailView: View {
    let store: StoreOf<DetailFeature>
    
    init(store: StoreOf<DetailFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack{
            Text("Detail View")
        }
    }
}
