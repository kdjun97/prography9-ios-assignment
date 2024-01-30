//
//  RandomPhotoFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct RandomPhotoFeature {
    struct State: Equatable {
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<RandomPhotoFeature> {
        Reduce { state, action in
            return .none
        }
    }
}
