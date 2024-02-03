//
//  NetworkRepository.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

class NetworkRepository: NetworkRepositoryProtocol {
    let apiService = ApiService()
    
    func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase> {
        let responseData = await apiService.callApiService(
            apiMethod: .get, 
            endPoint: EndPoint.photos,
            queryParameter: queryParameter
        )
        let entityDataResult = ResultMapper<[PhotoItem]>().toMap(responseData)
        switch entityDataResult {
        case let .success(entityData):
            let mappedData = PhotosListModelMapper().toPhotosModel(photoItem: entityData)
            return .success(mappedData)
        case let .failure(errorCase):
            return .failure(errorCase)
        }
    }
    
    func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase> {
        let responseData = await apiService.callApiService(
            apiMethod: .get,
            endPoint: EndPoint.photoDetail(id)
        )
        let entityDataResult = ResultMapper<PhotoItem>().toMap(responseData)
        switch entityDataResult {
        case let .success(entityData):
            let mappedData = PhotoModelMapper().toPhotosModel(photoItem: entityData)
            return .success(mappedData)
        case let .failure(errorCase):
            return .failure(errorCase)
        }
    }
    
    func getRandomPhoto() async -> Result<PhotosModel, ErrorCase> {
        let responseData = await apiService.callApiService(
            apiMethod: .get,
            endPoint: EndPoint.randomPhoto
        )
        let entityDataResult = ResultMapper<PhotoItem>().toMap(responseData)
        switch entityDataResult {
        case let .success(entityData):
            let mappedData = PhotoModelMapper().toPhotosModel(photoItem: entityData)
            return .success(mappedData)
        case let .failure(errorCase):
            return .failure(errorCase)
        }
    }
}
