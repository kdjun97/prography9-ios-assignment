//
//  PhotosModel.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public struct PhotosModel: Hashable {
    public let id: String
    public let width: Int
    public let height: Int
    public let description: String
    public let urls: PhotoUrl
    public let username: String
    
    public init(
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

public struct PhotoUrl: Hashable {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    public let smallS3: String
    
    public init(raw: String, full: String, regular: String, small: String, thumb: String, smallS3: String) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
        self.smallS3 = smallS3
    }
}
