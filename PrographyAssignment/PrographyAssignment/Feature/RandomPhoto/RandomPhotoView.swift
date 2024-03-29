//
//  RandomPhotoView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/29/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RandomPhotoView: View {
    let store: StoreOf<RandomPhotoFeature>
    let viewStore: ViewStoreOf<RandomPhotoFeature>
    
    init(store: StoreOf<RandomPhotoFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            PNavigationBar(isLogo: true)
            Divider()
                .background(.gray30)
            Spacer()
            RandomPhotoCardView(store: store, viewStore: viewStore)
        }
        .onAppear {
            viewStore.send(.onAppear)
        }
    }
}

private struct RandomPhotoCardView: View {
    private let store: StoreOf<RandomPhotoFeature>
    private let viewStore: ViewStoreOf<RandomPhotoFeature>
    private let rows = [GridItem(.flexible(), spacing: 0, alignment: nil)]
    
    fileprivate init(store: StoreOf<RandomPhotoFeature>, viewStore: ViewStoreOf<RandomPhotoFeature>) {
        self.store = store
        self.viewStore = viewStore
    }
    
    fileprivate var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(viewStore.photos, id: \.self) { item in
                    RandomPhotoCard(store: store, photo: item, viewStore: viewStore)
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
