//
//  MainFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainFeature{
    struct State: Equatable {
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<MainFeature> {
        Reduce { state, action in
            return .none
        }
    }
}
