//
//  ResultMapper.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation

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
