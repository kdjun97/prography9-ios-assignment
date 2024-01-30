//
//  RootView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RootView: View {
    private let store: StoreOf<RootFeature>
    @ObservedObject private var viewStore: ViewStoreOf<RootFeature>
    
    init(store: StoreOf<RootFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RootContentView(store: store)
            PTabBar(store: store)
        }
    }
}

private struct RootContentView: View {
    private let store: StoreOf<RootFeature>
    @ObservedObject private var viewStore: ViewStoreOf<RootFeature>
    
    fileprivate init(store: StoreOf<RootFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    fileprivate var body: some View {
        TabView(selection: viewStore.binding(get: \.selectedTabIndex, send: { newValue in .setSelectedTabIndex(newValue)})) {
            MainView(store: store.scope(state: \.mainState, action: \.mainAction)).tag(0)
            RandomPhotoView(store: store.scope(state: \.randomPhotoState, action: \.randomPhotoAction)).tag(1)
        }.tabViewStyle(.page(indexDisplayMode: .never))
    }
}

private struct PTabBar: View {
    private let store: StoreOf<RootFeature>
    @ObservedObject private var viewStore: ViewStoreOf<RootFeature>
    
    init(store: StoreOf<RootFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    private let tabItems: [TabItemList] = [.house, .cards]
    
    fileprivate var body: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(tabItems, id: \.self) { item in
                Button {
                    viewStore.send(.setSelectedTabIndex(item.rawValue))
                } label : {
                    Image(item.title)
                        .opacity(item.rawValue == viewStore.selectedTabIndex ? 1.0 : 0.4)
                }
                Spacer()
            }
        }
        .frame(height: 52)
        .background(.black90)
    }
}

private enum TabItemList: Int {
    case house = 0
    case cards
    
    fileprivate var title: String {
        switch self {
        case .house:
            return "house"
        case .cards:
            return "cards"
        }
    }
}
