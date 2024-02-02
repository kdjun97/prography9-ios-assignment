//
//  RootFeature.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootFeature {
    struct State: Equatable {
        var mainState = MainFeature.State()
        var randomPhotoState = RandomPhotoFeature.State()
        var detailState = DetailFeature.State()
        var selectedTabIndex: Int = 0
    }
    
    enum Action {
        case mainAction(MainFeature.Action)
        case randomPhotoAction(RandomPhotoFeature.Action)
        case detailAction(DetailFeature.Action)
        case setSelectedTabIndex(Int)
    }
    
    var body: some ReducerOf<RootFeature> {
        Reduce { state, action in
            switch action {
            case .setSelectedTabIndex(let value):
                state.selectedTabIndex = value
                return .none
            default:
                return .none
            }
        }
        Scope(state: \.mainState, action: /Action.mainAction, child: {
            MainFeature(
                pUseCase: PUsecase(networkRepositoryProtocol: NetworkRepository())
            )._printChanges()
        })
        Scope(state: \.randomPhotoState, action: /Action.randomPhotoAction, child: {
            RandomPhotoFeature()._printChanges()
        })
        Scope(state: \.detailState, action: /Action.detailAction, child: {
            DetailFeature()._printChanges()
        })
    }
}
