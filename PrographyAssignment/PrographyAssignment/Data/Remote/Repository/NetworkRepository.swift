//
//  NetworkRepository.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

class NetworkRepository: NetworkRepositoryProtocol {
    let apiService = ApiService()
    
    func getPhotos(endPoint: String) async -> Result<[PhotosModel], ErrorCase> {
        let responseData = await apiService.callApiService(apiMethod: .get, endPoint: endPoint)
        let entityDataResult = ResultMapper<[PhotoItem]>().toMap(responseData)
        switch entityDataResult {
        case let .success(entityData):
            let mappedData = PhotosModelMapper().toPhotosModel(photoItem: entityData)
            return .success(mappedData)
        case let .failure(errorCase):
            return .failure(errorCase)
        }
    }
}
