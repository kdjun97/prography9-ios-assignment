//
//  ApiService.swift
//  PrographyAssignment
//
//  Created by 김동준 on 1/31/24
//

import Foundation
import Combine

class ApiService {
    func callApiService(
        apiMethod: ApiMethod,
        endPoint: String
    ) async -> Result<Data, ErrorCase> {
        do {
            let urlComponents = URLComponents(string: "\(BaseUrl.baseUrl)\(endPoint)")
            let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = [
                "Authorization": "Client-ID NUHNZ0AdeQOaEW5TNz7R-_z7CoHoPPRPm0BscX3FGo8",
                "Content-Type": "application/json"
            ]
            let session = URLSession(configuration: config)
            
            guard let requestURL = urlComponents?.url else {
                return .failure(ErrorCase.nilError)
            }
            
            let (data, response) = try await session.data(from: requestURL)
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                return .failure(ErrorCase.nilError)
            }
            
            let range = 200..<300
            if (range.contains(statusCode)) {
                return .success(data)
            } else {
                return .failure(ErrorCase.apiError(statusCode))
            }
        } catch let error {
            return .failure(ErrorCase.unKnownError(error.localizedDescription))
        }
    }
}

enum ApiMethod {
    case get
}
