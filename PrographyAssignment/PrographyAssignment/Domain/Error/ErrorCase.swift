//
//  ErrorCase.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/1/24
//

import Foundation

enum ErrorCase: Error {
    case serverError
    case unKnownError(String)
    case parsingError
    case apiError(Int)
    case nilError
}
