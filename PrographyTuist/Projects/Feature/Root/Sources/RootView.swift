//
//  RootView.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI
import ComposableArchitecture
import DesignSystem
import MainFeature
import DetailFeature
import RandomPhotoFeature

public struct RootView: View {
    private let store: StoreOf<RootFeature>
    @ObservedObject private var viewStore: ViewStoreOf<RootFeature>
    
    public init(store: StoreOf<RootFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack(spacing: 0) {
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
            MainView(store: store.scope(state: \.mainState, action: RootFeature.Action.mainAction)).tag(0)
            RandomPhotoView(store: store.scope(state: \.randomPhotoState, action: RootFeature.Action.randomPhotoAction)).tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .fullScreenCover(isPresented: viewStore.$isDetailPhoto) {
            DetailView(store: store.scope(state: \.detailState, action: RootFeature.Action.detailAction))
        }
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
                    item.image
                        .opacity(item.rawValue == viewStore.selectedTabIndex ? 1.0 : 0.4)
                }
                Spacer()
            }
        }
        .frame(height: 52)
        .background(DesignSystemAsset.black90.swiftUIColor)
    }
}

private enum TabItemList: Int {
    case house = 0
    case cards
    
    fileprivate var image: Image {
        switch self {
        case .house:
            return DesignSystemAsset.house.swiftUIImage
        case .cards:
            return DesignSystemAsset.cards.swiftUIImage
        }
    }
}
