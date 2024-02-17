//
//  LocalRepository.swift
//  Data
//
//  Created by 김동준 on 2/17/24
//

import Foundation
import Domain

public struct LocalRepository: LocalRepositoryProtocol {
    let localStorage = LocalStorage()
    
    public init() {}
    
    public func getBookMarkInformation() -> [BookMarkModel] {
        do {
            if let data = localStorage.getObjectData(key: LocalStorageKey.BOOKMARK_ID) {
                let decodedData = try? PropertyListDecoder().decode([BookMarkModel].self, from: data)
                return decodedData ?? []
            }
            return []
        } catch {
            return []
        }
    }
    
    public func setBookMarkInformation(data: [BookMarkModel]) {
        do {
            let data = try? PropertyListEncoder().encode(data)
            localStorage.setData(key: LocalStorageKey.BOOKMARK_ID, value: data)
        } catch {
            
        }
    }
}
