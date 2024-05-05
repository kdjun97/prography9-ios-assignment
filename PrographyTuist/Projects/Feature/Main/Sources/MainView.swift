//
//  MainView.swift
//  ProjectDescriptionHelpers
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct MainView: View {
    let store: StoreOf<MainFeature>
    @ObservedObject private var viewStore: ViewStoreOf<MainFeature>
    
    public init(store: StoreOf<MainFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            PNavigationBar(isLogo: true)
            Divider()
                .background(DesignSystemAsset.gray30.swiftUIColor)
            ScrollView {
                LazyVStack(spacing: 0) {
                    if (!viewStore.bookmarks.isEmpty) {
                        BookMarkView(viewStore: viewStore)
                            .padding(.top, 20)
                    }
                    Spacer()
                        .frame(height: !viewStore.bookmarks.isEmpty ? 12 : 20)
                    RecentlyImageView(viewStore: viewStore)
                    if (!viewStore.isLastPage) {
                        InfiniteScrollProgressView(viewStore: viewStore)
                    }
                }
            }
        }
        .onAppear {
            viewStore.send(.onAppear)
        }
    }
}

private struct BookMarkView: View {
    @ObservedObject private var viewStore: ViewStoreOf<MainFeature>
    let rows = [GridItem(.flexible(), spacing: 0, alignment: nil)]
    
    init(viewStore: ViewStoreOf<MainFeature>) {
        self.viewStore = viewStore
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CellTitleView(title: "북마크")
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(viewStore.bookmarks, id: \.self) { item in
                        Button {
                            viewStore.send(.photoTapped(item.id))
                        } label: {
                            PhotoGridItemView(
                                width: item.width,
                                height: item.height,
                                url: item.url
                            )
                            .cornerRadius(10)
                            .clipped()
                        }
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.leading, 16)
            .frame(maxHeight: .infinity)
        }
        .frame(height: 195)
    }
}

private struct RecentlyImageView: View {
    @ObservedObject private var viewStore: ViewStoreOf<MainFeature>
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    
    init(viewStore: ViewStoreOf<MainFeature>) {
        self.viewStore = viewStore
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CellTitleView(title: "최신 이미지")
            ScrollView {
                HStack(alignment: .top, spacing: 10) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(Array(zip(viewStore.photos.indices, viewStore.photos)), id: \.0) { index, item in
                            if (index % 2 == 0) {
                                Button {
                                    viewStore.send(.photoTapped(item.id))
                                } label: {
                                    PhotoGridItemView(
                                        width: item.width,
                                        height: item.height,
                                        url: item.urls.small
                                    )
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                                    .clipped()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(Array(zip(viewStore.photos.indices, viewStore.photos)), id: \.0) { index, item in
                            if (index % 2 == 1) {
                                Button {
                                    viewStore.send(.photoTapped(item.id))
                                } label: {
                                    PhotoGridItemView(
                                        width: item.width,
                                        height: item.height,
                                        url: item.urls.small
                                    )
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                                    .clipped()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
        }
    }
}

private struct InfiniteScrollProgressView: View {
    @ObservedObject private var viewStore: ViewStoreOf<MainFeature>
    
    init(viewStore: ViewStoreOf<MainFeature>) {
        self.viewStore = viewStore
    }
    
    var body: some View {
        ProgressView()
            .frame(height: 64)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    viewStore.send(.fetchPhotos)
                }
            }
    }
}
