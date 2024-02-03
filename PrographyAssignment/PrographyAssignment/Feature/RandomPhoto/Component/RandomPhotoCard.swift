//
//  RandomPhotoCard.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

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
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 15).stroke(.gray30)
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
        .background(.black)
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
                Image("x36")
                    .padding(8)
                    .background(Circle().stroke(.gray30).foregroundColor(.white))
            }
            Button {
                viewStore.send(.onAppear)
            } label : {
                Image("bookmark32")
                    .padding(20)
                    .background(Circle().foregroundColor(.brandcolor))
            }
            Button {
                viewStore.send(.informationButtonTapped(photo))
            } label : {
                Image("information")
                    .padding(8)
                    .background(Circle().stroke(.gray30).foregroundColor(.white))
            }
        }
        .padding(.horizontal, 44)
        .padding(.vertical, 24)
        .background(.white)
    }
}
