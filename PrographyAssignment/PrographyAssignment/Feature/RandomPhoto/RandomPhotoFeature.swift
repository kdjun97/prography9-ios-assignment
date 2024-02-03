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
    let pUseCase: PUsecase
    
    init(pUseCase: PUsecase) {
        self.pUseCase = pUseCase
    }
    
    struct State: Equatable {
        var photos: [PhotosModel] = []
    }
    
    enum Action {
        case onAppear
        case appendPhotoList(PhotosModel)
        case informationButtonTapped(PhotosModel)
    }
    
    var body: some ReducerOf<RandomPhotoFeature> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(getRandomPhoto())
                }
            case let .appendPhotoList(model):
                state.photos.append(model)
                return .none
            case let .informationButtonTapped(detailModel):
                return .none
            }
        }
    }
}

extension RandomPhotoFeature {
    func getRandomPhoto() async -> Action {
        let response = await pUseCase.getRandomPhoto()
        
        switch response {
        case let .success(photosModel):
            return .appendPhotoList(photosModel)
        case let .failure(errorCase):
            return .appendPhotoList(.init()) // need Error handling
        }
    }
}
