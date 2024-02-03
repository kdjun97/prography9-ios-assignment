//
//  LocalUsecase.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation

struct LocalUsecase {
    let localRepositoryProtocol: LocalRepositoryProtocol

    func getBookMarkInformation() -> [BookMarkModel] {
        return localRepositoryProtocol.getBookMarkInformation()
    }
    
    func setBookMarkInformation(model: BookMarkModel) {
        var bookmarkList = getBookMarkInformation()
        bookmarkList.append(model)
        localRepositoryProtocol.setBookMarkInformation(data: bookmarkList)
    }
    
    func removeBookMarkInformation(model: BookMarkModel) {
        var bookmarkList = getBookMarkInformation()
        if let index = bookmarkList.firstIndex(of: model) {
            bookmarkList.remove(at: index)
            localRepositoryProtocol.setBookMarkInformation(data: bookmarkList)
        }
    }
}
