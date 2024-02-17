//
//  RootFeature.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import ComposableArchitecture
import Domain
import MainFeature
import DetailFeature
import RandomPhotoFeature
import Data

public struct RootFeature: Reducer {
    let pUseCase = PUsecase(networkRepositoryProtocol: NetworkRepository())
    let localUseCase = LocalUsecase(localRepositoryProtocol: LocalRepository())
    
    public init() {}
    
    public struct State: Equatable {
        public init() {}
        var mainState = MainFeature.State()
        var randomPhotoState = RandomPhotoFeature.State()
        var detailState = DetailFeature.State()
        var selectedTabIndex: Int = 0
        @BindingState var isDetailPhoto: Bool = false
    }
    
    public enum Action: BindableAction {
        case mainAction(MainFeature.Action)
        case randomPhotoAction(RandomPhotoFeature.Action)
        case detailAction(DetailFeature.Action)
        case setSelectedTabIndex(Int)
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerOf<RootFeature> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .setSelectedTabIndex(let value):
                state.selectedTabIndex = value
                return .none
            case let .mainAction(.showFullScreenCoverFromRoot(detailModel)):
                state.detailState.model = detailModel
                state.isDetailPhoto = true
                return .none
            case .detailAction(.backButtonTapped):
                state.isDetailPhoto = false
                return .send(.mainAction(.fetchBookmark))
            case let .randomPhotoAction(.informationButtonTapped(detailModel)):
                state.detailState.model = detailModel
                state.isDetailPhoto = true
                return .none
            case .binding:
                return .none
            default :
                return .none
            }
        }
        Scope(state: \.mainState, action: /Action.mainAction, child: {
            MainFeature(pUseCase: pUseCase, localUseCase: localUseCase)._printChanges()
        })
        Scope(state: \.randomPhotoState, action: /Action.randomPhotoAction, child: {
            RandomPhotoFeature(pUseCase: pUseCase)._printChanges()
        })
        Scope(state: \.detailState, action: /Action.detailAction, child: {
            DetailFeature(pUseCase: pUseCase, localUseCase: localUseCase)._printChanges()
        })
    }
}
