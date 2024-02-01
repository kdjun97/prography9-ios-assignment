//
//  PhotosModelMapper.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

struct PhotosModelMapper {
    func toPhotosModel(photoItem: [PhotoItem]) -> [PhotosModel] {
        return photoItem.map { element in
            PhotosModel(
                id: element.id ?? "",
                width: element.width ?? 0,
                height: element.height ?? 0,
                color: element.color ?? "",
                description: element.description ?? "",
                urls: PhotosModelMapper.toPhotoUrl(element.urls),
                links: PhotosModelMapper.toPhotoLink(element.links),
                likes: element.likes ?? 0,
                likedByUser: element.likedByUser ?? false
            )
        }
    }
}

extension PhotosModelMapper {
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
}

extension PhotosModelMapper {
    static func toPhotoLink(_ photoLinks: PhotoLinks?) -> PhotoLink {
        if let photoLinks = photoLinks {
            return PhotoLink(
                linksSelf: photoLinks.linksSelf ?? "",
                html: photoLinks.html ?? "",
                download: photoLinks.download ?? "",
                downloadLocation: photoLinks.downloadLocation ?? ""
            )
        } else {
            return PhotoLink(
                linksSelf: "",
                html: "",
                download: "",
                downloadLocation: ""
            )
        }
    }
}
