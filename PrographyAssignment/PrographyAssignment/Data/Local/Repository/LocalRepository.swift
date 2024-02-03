//
//  LocalRepository.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation

struct LocalRepository: LocalRepositoryProtocol {
    let localStorage = LocalStorage()
    
    func getBookMarkInformation() -> [BookMarkModel] {
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
    
    func setBookMarkInformation(data: [BookMarkModel]) {
        do {
            let data = try? PropertyListEncoder().encode(data)
            localStorage.setData(key: LocalStorageKey.BOOKMARK_ID, value: data)
        } catch {
            
        }
    }
}
