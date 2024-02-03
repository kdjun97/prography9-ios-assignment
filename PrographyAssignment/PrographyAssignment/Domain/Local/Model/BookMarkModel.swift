//
//  BookMarkModel.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/4/24
//

import Foundation

struct BookMarkModel: Hashable, Codable {
    let id: String
    let width: Int
    let height: Int
    let url: String
    let description: String
    
    init(
        id: String = "",
        width: Int = 0,
        height: Int = 0,
        url: String = "",
        description: String = ""
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
        self.description = description
    }
}
