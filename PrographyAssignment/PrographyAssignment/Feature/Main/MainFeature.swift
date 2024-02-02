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
        var currentPageIndex: Int = 1
        var isLastPage: Bool = false
    }
    
    enum Action {
        case onAppear
        case appendPhotos([PhotosModel])
        case fetchPhotos
    }
    
    var body: some ReducerOf<MainFeature> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { [currentPageIndex = state.currentPageIndex] send in
                    await send(getPhotos(currentPageIndex: currentPageIndex))
                }
            case .fetchPhotos:
                return .run { [currentPageIndex = state.currentPageIndex] send in
                    await send(getPhotos(currentPageIndex: currentPageIndex+1))
                }
            case let .appendPhotos(photos):
                state.isLastPage = compareLastPage(state: &state, receivedPhotos: photos)
                if (!state.isLastPage) {
                    state.currentPageIndex += 1
                    state.photos += photos
                }
                return .none
            }
        }
    }
}

extension MainFeature {
    func getPhotos(currentPageIndex: Int) async -> Action {
        let response = await pUseCase.getPhotos(queryParameter: ["page": String(currentPageIndex)])
        
        switch response {
        case let .success(photosModel):
            return .appendPhotos(photosModel)
        case let .failure(errorCase):
            return .appendPhotos([]) // TODO : Error Handling
        }
    }
    
    func compareLastPage(state: inout State, receivedPhotos: [PhotosModel]) -> Bool {
        if let receivedPhotosLastIndexId = receivedPhotos.last?.id,
            let storedPhotosLastIndexId = state.photos.last?.id  {
            return (receivedPhotosLastIndexId == storedPhotosLastIndexId)
        } else {
            return false
        }
    }
}
