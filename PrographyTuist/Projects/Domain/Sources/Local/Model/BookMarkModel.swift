//
//  BookMarkModel.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public struct BookMarkModel: Hashable, Codable {
    public let id: String
    public let width: Int
    public let height: Int
    public let url: String
    public let description: String
    
    public init(
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
