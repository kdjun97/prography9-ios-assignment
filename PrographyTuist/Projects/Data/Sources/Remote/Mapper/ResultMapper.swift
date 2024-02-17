//
//  ResultMapper.swift
//  Data
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import Domain

struct ResultMapper<T: Codable> {
    func toMap(_ result: Result<Data, ErrorCase>) -> Result<T, ErrorCase> {
        switch result {
        case let .success(data):
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure(ErrorCase.parsingError)
            }
        case let .failure(errorCase):
            return .failure(errorCase)
        }
    }
}
