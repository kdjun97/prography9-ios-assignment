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
    let color: String
    let description: String
    let urls: PhotoUrl
    let links: PhotoLink
    let likes: Int
    let likedByUser: Bool
    
    init(
        id: String,
        width: Int,
        height: Int,
        color: String,
        description: String,
        urls: PhotoUrl,
        links: PhotoLink,
        likes: Int,
        likedByUser: Bool
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.color = color
        self.description = description
        self.urls = urls
        self.links = links
        self.likes = likes
        self.likedByUser = likedByUser
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

struct PhotoLink: Hashable {
    let linksSelf: String
    let html: String
    let download: String
    let downloadLocation: String
}
