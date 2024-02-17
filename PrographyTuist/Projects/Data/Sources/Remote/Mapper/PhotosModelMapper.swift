//
//  PhotosModelMapper.swift
//  Data
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import Domain

struct PhotosListModelMapper {
    func toPhotosModel(photoItem: [PhotoItem]) -> [PhotosModel] {
        return photoItem.map { element in
            PhotosModel(
                id: element.id ?? "",
                width: element.width ?? 0,
                height: element.height ?? 0,
                description: element.description ?? "",
                urls: PhotosListModelMapper.toPhotoUrl(element.urls),
                username: PhotosListModelMapper.toUsername(element.user)
            )
        }
    }
}

extension PhotosListModelMapper {
    static func toPhotoUrl(_ photoUrls: PhotoUrls?) -> PhotoUrl {
        if let photoUrls = photoUrls {
            return PhotoUrl(
                raw: photoUrls.raw ?? "",
                full: photoUrls.full ?? "",
                regular: photoUrls.regular ?? "",
                small: photoUrls.small ?? "",
                thumb: photoUrls.thumb ?? "",
                smallS3: photoUrls.smallS3 ?? ""
            )
        } else {
            return PhotoUrl(
                raw: "",
                full: "",
                regular: "",
                small: "",
                thumb: "",
                smallS3: ""
            )
        }
    }
    
    static func toUsername(_ user: User?) -> String {
        if let username = user?.username {
            return username
        } else {
            return "-"
        }
    }
}
