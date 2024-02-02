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
        endPoint: String,
        queryParameter: [String:String]? = nil
    ) async -> Result<Data, ErrorCase> {
        do {
            let urlComponents = URLComponents(string: "\(BaseUrl.baseUrl)\(endPoint)")
            
            guard var urlComponent = urlComponents else {
                return .failure(ErrorCase.nilError)
            }
            
            let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = [
                "Authorization": "Client-ID NUHNZ0AdeQOaEW5TNz7R-_z7CoHoPPRPm0BscX3FGo8",
                "Content-Type": "application/json"
            ]
            
            let session = URLSession(configuration: config)
            
            if let queryParameter = queryParameter {
                urlComponent.queryItems = queryParameter.map { dictionary in
                    URLQueryItem(name: dictionary.key, value: dictionary.value)
                }
            }
            
            guard let requestURL = urlComponent.url else {
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
