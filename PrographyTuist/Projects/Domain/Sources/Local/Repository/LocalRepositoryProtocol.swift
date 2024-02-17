//
//  LocalRepositoryProtocol.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public protocol LocalRepositoryProtocol {
    func getBookMarkInformation() -> [BookMarkModel]
    func setBookMarkInformation(data: [BookMarkModel])
}
