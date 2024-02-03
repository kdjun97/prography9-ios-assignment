//
//  PhotosDetailModelMapper.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation

struct PhotoModelMapper {
    func toPhotosModel(photoItem: PhotoItem) -> PhotosModel {
        return PhotosModel(
            id: photoItem.id ?? "",
            width: photoItem.width ?? 0,
            height: photoItem.height ?? 0,
            description: photoItem.description ?? "",
            urls: PhotoModelMapper.toPhotoUrl(photoItem.urls),
            username: PhotoModelMapper.toUsername(photoItem.user)
        )
    }
}

extension PhotoModelMapper {
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
