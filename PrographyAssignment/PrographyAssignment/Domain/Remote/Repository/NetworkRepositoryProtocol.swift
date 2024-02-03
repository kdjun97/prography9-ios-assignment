//
//  NetworkRepositoryProtocol.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

protocol NetworkRepositoryProtocol {
    func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase>
    func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase>
}
