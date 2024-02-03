//
//  PhotosModel.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

struct PhotosModel: Hashable {
    let id: String
    let width: Int
    let height: Int
    let description: String
    let urls: PhotoUrl
    
    init(
        id: String,
        width: Int,
        height: Int,
        description: String,
        urls: PhotoUrl
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.description = description
        self.urls = urls
    }
}

struct PhotoUrl: Hashable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
    let smallS3: String
}
