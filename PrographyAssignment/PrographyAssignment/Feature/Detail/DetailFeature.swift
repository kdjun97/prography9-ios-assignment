//
//  DetailFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/30/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct DetailFeature {
    let pUseCase: PUsecase
    
    struct State: Equatable {
        var model: PhotosModel = .init()
    }
    
    enum Action {
        case backButtonTapped
        case onAppear
        case setDetailPhotoInformation
    }
    
    var body: some ReducerOf<DetailFeature> {
        Reduce { state, action in
            switch action {
            case .backButtonTapped:
                return .none
            case .onAppear:
                return .none
            case .setDetailPhotoInformation:
                return .none
            }
        }
    }
}

extension DetailFeature {
    
}
