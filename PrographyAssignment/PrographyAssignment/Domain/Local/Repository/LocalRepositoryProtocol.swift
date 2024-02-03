//
//  LocalRepositoryProtocol.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation

protocol LocalRepositoryProtocol {
    func getBookMarkInformation() -> [BookMarkModel]
    func setBookMarkInformation(data: [BookMarkModel])
}
