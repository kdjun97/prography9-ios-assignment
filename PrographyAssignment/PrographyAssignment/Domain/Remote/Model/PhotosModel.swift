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
    let username: String
    
    init(
        id: String = "",
        width: Int = 0,
        height: Int = 0,
        description: String = "",
        urls: PhotoUrl = .init(
            raw: "",
            full: "",
            regular: "",
            small: "",
            thumb: "",
            smallS3: ""
        ),
        username: String = ""
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.description = description
        self.urls = urls
        self.username = username
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
