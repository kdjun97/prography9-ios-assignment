//
//  LocalUseCase.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public struct LocalUsecase {
    let localRepositoryProtocol: LocalRepositoryProtocol
    
    public init(localRepositoryProtocol: LocalRepositoryProtocol) {
        self.localRepositoryProtocol = localRepositoryProtocol
    }

    public func getBookMarkInformation() -> [BookMarkModel] {
        return localRepositoryProtocol.getBookMarkInformation()
    }
    
    public func setBookMarkInformation(model: BookMarkModel) {
        var bookmarkList = getBookMarkInformation()
        bookmarkList.append(model)
        localRepositoryProtocol.setBookMarkInformation(data: bookmarkList)
    }
    
    public func removeBookMarkInformation(model: BookMarkModel) {
        var bookmarkList = getBookMarkInformation()
        if let index = bookmarkList.firstIndex(of: model) {
            bookmarkList.remove(at: index)
            localRepositoryProtocol.setBookMarkInformation(data: bookmarkList)
        }
    }
}
