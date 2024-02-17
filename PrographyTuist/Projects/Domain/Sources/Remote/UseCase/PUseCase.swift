//
//  PUseCase.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public struct PUsecase {
    let networkRepositoryProtocol: NetworkRepositoryProtocol
    
    public init(networkRepositoryProtocol: NetworkRepositoryProtocol) {
        self.networkRepositoryProtocol = networkRepositoryProtocol
    }
    
    public func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase> {
        return await networkRepositoryProtocol.getPhotos(queryParameter: queryParameter)
    }
    
    public func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase> {
        return await networkRepositoryProtocol.getDetailPhoto(id: id)
    }
    
    public func getRandomPhoto() async -> Result<PhotosModel, ErrorCase> {
        return await networkRepositoryProtocol.getRandomPhoto()
    }
}
