//
//  PUseCase.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

struct PUsecase {
    let networkRepositoryProtocol: NetworkRepositoryProtocol
    
    func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase> {
        return await networkRepositoryProtocol.getPhotos(queryParameter: queryParameter)
    }
    
    func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase> {
        return await networkRepositoryProtocol.getDetailPhoto(id: id)
    }
    
    func getRandomPhoto() async -> Result<PhotosModel, ErrorCase> {
        return await networkRepositoryProtocol.getRandomPhoto()
    }
}
