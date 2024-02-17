//
//  NetworkRepository.swift
//  Data
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import Domain

public class NetworkRepository: NetworkRepositoryProtocol {
    let apiService = ApiService()
    
    public init() {}
    
    public func getPhotos(queryParameter: [String:String]) async -> Result<[PhotosModel], ErrorCase> {
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
    
    public func getDetailPhoto(id: String) async -> Result<PhotosModel, ErrorCase> {
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
    
    public func getRandomPhoto() async -> Result<PhotosModel, ErrorCase> {
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
