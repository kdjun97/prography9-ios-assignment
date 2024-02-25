//
//  DetailView.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/30/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct DetailView: View {
    let store: StoreOf<DetailFeature>
    let viewStore: ViewStoreOf<DetailFeature>
    
    init(store: StoreOf<DetailFeature>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            PNavigationBar(
                isLogo: false,
                title: viewStore.model.username,
                isBookmarked: viewStore.isBookmarked,
                buttonAction: { viewStore.send(.backButtonTapped) },
                bookmarkButtonAction: { viewStore.send(.bookmarkButtonTapped) }
            )
            DetailPhotoView(store: store, viewStore: viewStore)
            PhotoDescriptionView(store: store, viewStore: viewStore)
        }
        .opaqueBackground()
        .onAppear {
            viewStore.send(.onAppear)
        }
    }
}

private struct DetailPhotoView: View {
    private let store: StoreOf<DetailFeature>
    private let viewStore: ViewStoreOf<DetailFeature>
    
    fileprivate init(store: StoreOf<DetailFeature>, viewStore: ViewStoreOf<DetailFeature>) {
        self.store = store
        self.viewStore = viewStore
    }
    
    fileprivate var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = Int(width) * viewStore.model.height / viewStore.model.width
            ZStack {
                PhotoGridItemView(
                    width: viewStore.model.width,
                    height: viewStore.model.height,
                    url: viewStore.model.urls.small
                )
                .frame(width: CGFloat(width), height: CGFloat(height))
                .cornerRadius(10)
                .clipped()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxHeight: .infinity)
        .padding(12)
    }
}

private struct PhotoDescriptionView: View {
    private let store: StoreOf<DetailFeature>
    private let viewStore: ViewStoreOf<DetailFeature>
    
    fileprivate init(store: StoreOf<DetailFeature>, viewStore: ViewStoreOf<DetailFeature>) {
        self.store = store
        self.viewStore = viewStore
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("Title")
                    .lineLimit(1)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.top, 8)
            HStack(spacing: 0) {
                Text(viewStore.model.description)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.top, 4)
            HStack(spacing: 0) {
                Text("#tag #tag #tag #tag")
                    .lineLimit(1)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
            }
            .padding(.top, 4)
            .padding(.bottom, 8)
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 108)
    }
}
