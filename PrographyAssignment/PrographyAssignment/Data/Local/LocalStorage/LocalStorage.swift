//
//  LocalStorage.swift
//  PrographyAssignment
//
//  Created by 김동준 on 2/3/24
//

import Foundation

class LocalStorage {
    func getObjectData(key: String) -> Data? {
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            return data
        } else {
            return nil
        }
    }
    
    func setData<T>(key: String, value: T) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
}
