//
//  DetailFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/30/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct DetailFeature{
    struct State: Equatable {
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<DetailFeature> {
        Reduce { state, action in
            return .none
        }
    }
}
