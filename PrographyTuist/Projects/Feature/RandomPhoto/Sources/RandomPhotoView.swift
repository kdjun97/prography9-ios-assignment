//
//  RandomPhotoView.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct RandomPhotoView: View {
    let store: StoreOf<RandomPhotoFeature>
    let viewStore: ViewStoreOf<RandomPhotoFeature>
    
    public init(store: StoreOf<RandomPhotoFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            PNavigationBar(isLogo: true)
            Divider()
                .background(DesignSystemAsset.gray30.swiftUIColor)
            Spacer()
            RandomPhotoCardView(viewStore: viewStore)
        }
        .onAppear {
            viewStore.send(.onAppear)
        }
    }
}

private struct RandomPhotoCardView: View {
    let viewStore: ViewStoreOf<RandomPhotoFeature>
    let rows = [GridItem(.flexible(), spacing: 0, alignment: nil)]
    
    init(viewStore: ViewStoreOf<RandomPhotoFeature>) {
        self.viewStore = viewStore
    }
    
    fileprivate var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(viewStore.photos, id: \.self) { item in
                    RandomPhotoCard(viewStore: viewStore, photo: item)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(10)
                    .clipped()
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.leading, 16)
        .frame(maxHeight: .infinity)
    }
}
