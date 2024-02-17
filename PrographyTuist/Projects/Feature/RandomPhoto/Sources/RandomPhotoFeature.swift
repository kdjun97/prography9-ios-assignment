//
//  RandomPhotoFeature.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import Domain
import ComposableArchitecture

public struct RandomPhotoFeature: Reducer {
    let pUseCase: PUsecase
    
    public init(pUseCase: PUsecase) {
        self.pUseCase = pUseCase
    }
    
    public struct State: Equatable {
        public init() {}
        var photos: [PhotosModel] = []
    }
    
    public enum Action {
        case onAppear
        case appendPhotoList(PhotosModel)
        case informationButtonTapped(PhotosModel)
    }
    
    public var body: some ReducerOf<RandomPhotoFeature> {
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
    private func getRandomPhoto() async -> Action {
        let response = await pUseCase.getRandomPhoto()
        
        switch response {
        case let .success(photosModel):
            return .appendPhotoList(photosModel)
        case let .failure(errorCase):
            return .appendPhotoList(.init()) // need Error handling
        }
    }
}
