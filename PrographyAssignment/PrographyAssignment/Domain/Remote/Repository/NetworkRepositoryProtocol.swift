//
//  NetworkRepositoryProtocol.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

protocol NetworkRepositoryProtocol {
    func getPhotos(endPoint: String) async -> Result<[PhotosModel], ErrorCase>
}
