//
//  ErrorCase.swift
//  Domain
//
//  Created by 김동준 on 2/17/24
//

import Foundation

public enum ErrorCase: Error {
    case serverError
    case unKnownError(String)
    case parsingError
    case apiError(Int)
    case nilError
}
