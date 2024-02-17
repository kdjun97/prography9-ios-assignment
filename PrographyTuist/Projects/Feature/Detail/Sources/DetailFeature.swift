//
//  DetailFeature.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import ComposableArchitecture
import Domain

public struct DetailFeature: Reducer {
    let pUseCase: PUsecase
    let localUseCase: LocalUsecase
    
    public init(pUseCase: PUsecase, localUseCase: LocalUsecase) {
        self.pUseCase = pUseCase
        self.localUseCase = localUseCase
    }
    
    public struct State: Equatable {
        public init() {}
        public var model: PhotosModel = .init()
        var isBookmarked: Bool = false
    }
    
    public enum Action {
        case backButtonTapped
        case onAppear
        case setDetailPhotoInformation
        case bookmarkButtonTapped
    }
    
    public var body: some ReducerOf<DetailFeature> {
        Reduce { state, action in
            switch action {
            case .backButtonTapped:
                return .none
            case .onAppear:
                let data = localUseCase.getBookMarkInformation()
                state.isBookmarked = data.contains(where: { $0.id == state.model.id })
                return .none
            case .setDetailPhotoInformation:
                return .none
            case .bookmarkButtonTapped:
                appendOrRemoveBookmark(state: &state)
                state.isBookmarked.toggle()
                
                return .none
            }
        }
    }
}

extension DetailFeature {
    private func appendOrRemoveBookmark(state: inout State) {
        if (state.isBookmarked) {
            localUseCase.removeBookMarkInformation(
                model: BookMarkModel(
                    id: state.model.id,
                    width: state.model.width,
                    height: state.model.height,
                    url: state.model.urls.small,
                    description: state.model.description
                )
            )
        } else {
            localUseCase.setBookMarkInformation(
                model: BookMarkModel(
                    id: state.model.id,
                    width: state.model.width,
                    height: state.model.height,
                    url: state.model.urls.small,
                    description: state.model.description
                )
            )
        }
    }
}
