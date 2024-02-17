//
//  NetworkRepositoryProtocol.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public protocol NetworkRepositoryProtocol {
    func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase>
    func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase>
    func getRandomPhoto() async -> Result<PhotosModel, ErrorCase>
}
