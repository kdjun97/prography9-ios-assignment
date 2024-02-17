//
//  RandomPhotoCard.swift
//  RandomPhotoFeature
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import SwiftUI
import DesignSystem
import ComposableArchitecture
import Domain

struct RandomPhotoCard: View {
    let store: StoreOf<RandomPhotoFeature>
    let viewStore: ViewStoreOf<RandomPhotoFeature>
    let photo: PhotosModel
    
    init(store: StoreOf<RandomPhotoFeature>, photo: PhotosModel) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
        self.photo = photo
    }
    
    var body: some View {
        VStack(spacing: 0) {
            PhotoView(photo: photo)
            PhotoHorizontalButton(store: store, photo: photo)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystemAsset.white.swiftUIColor)
        .cornerRadius(15)
        .shadow(color: DesignSystemAsset.black.swiftUIColor.opacity(0.1), radius: 12, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 15).stroke(DesignSystemAsset.gray30.swiftUIColor)
        )
        .padding(.horizontal, 24)
        .padding(.top, 22)
        .padding(.bottom, 44)
    }
}

private struct PhotoView: View {
    let photo: PhotosModel
    
    init(photo: PhotosModel) {
        self.photo = photo
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = Int(width) * photo.height / photo.width
            ZStack {
                PhotoGridItemView(
                    width: photo.width,
                    height: photo.height,
                    url: photo.urls.small
                )
                .frame(width: CGFloat(width), height: CGFloat(height))
                .clipped()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxHeight: .infinity)
        .background(DesignSystemAsset.black.swiftUIColor)
        .cornerRadius(10)
        .padding(.top, 12)
        .padding(.horizontal, 12)
    }
}

private struct PhotoHorizontalButton: View {
    let store: StoreOf<RandomPhotoFeature>
    let viewStore: ViewStoreOf<RandomPhotoFeature>
    let photo: PhotosModel
    
    init(store: StoreOf<RandomPhotoFeature>, photo: PhotosModel) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
        self.photo = photo
    }
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                
            } label : {
                DesignSystemAsset.x36.swiftUIImage
                    .padding(8)
                    .background(Circle().stroke(DesignSystemAsset.gray30.swiftUIColor).foregroundColor(DesignSystemAsset.white.swiftUIColor))
            }
            Button {
                viewStore.send(.onAppear)
            } label : {
                DesignSystemAsset.bookmark32.swiftUIImage
                    .padding(20)
                    .background(Circle().foregroundColor(DesignSystemAsset.brandcolor.swiftUIColor))
            }
            Button {
                viewStore.send(.informationButtonTapped(photo))
            } label : {
                DesignSystemAsset.information.swiftUIImage
                    .padding(8)
                    .background(Circle().stroke(DesignSystemAsset.gray30.swiftUIColor).foregroundColor(DesignSystemAsset.white.swiftUIColor))
            }
        }
        .padding(.horizontal, 44)
        .padding(.vertical, 24)
        .background(DesignSystemAsset.white.swiftUIColor)
    }
}
