//
//  RandomPhotoView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RandomPhotoView: View {
    let store: StoreOf<RandomPhotoFeature>
    
    init(store: StoreOf<RandomPhotoFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack{
            Text("RandomPhoto View")
        }
    }
}
