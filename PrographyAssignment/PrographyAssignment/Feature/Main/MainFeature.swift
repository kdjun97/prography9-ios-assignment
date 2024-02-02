//
//  MainFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainFeature {
    let pUseCase: PUsecase
    
    init(pUseCase: PUsecase) {
        self.pUseCase = pUseCase
    }
    
    struct State: Equatable {
        var bookmarks: [PhotosModel] = []
        var photos: [PhotosModel] = []
    }
    
    enum Action {
        case onAppear
        case setPhotos([PhotosModel])
    }
    
    var body: some ReducerOf<MainFeature> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    await send(getPhotos())
                }
            case let .setPhotos(photos):
                print("dONGdONG")
                print(photos.count)
                print(photos[0])
                print("dONGdONG")
                
                state.photos = photos
                return .none
            }
        }
    }
}

extension MainFeature {
    func getPhotos() async -> Action {
        let response = await pUseCase.getPhotos(queryParameter: ["page": "2"])
        
        switch response {
        case let .success(photosModel):
            return .setPhotos(photosModel)
        case let .failure(errorCase):
            return .setPhotos([]) // TODO : Error Handling
        }
    }
}
