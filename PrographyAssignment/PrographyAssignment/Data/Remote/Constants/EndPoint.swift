//
//  EndPoint.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

struct EndPoint {
    static let photos = "/photos"
    static let randomPhoto = "/photos/random"
    static var photoDetail: (String) -> String = { id in
        "/photos/\(id)"
    }
}
