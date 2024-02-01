//
//  PUseCase.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

struct PUsecase {
    let networkRepositoryProtocol: NetworkRepositoryProtocol
    
    func getPhotos(endPoint: String) async -> Result<[PhotosModel], ErrorCase> {
        return await networkRepositoryProtocol.getPhotos(endPoint: endPoint)
    }
}
