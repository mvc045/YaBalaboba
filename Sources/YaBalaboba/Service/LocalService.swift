//
//  LocalStorageService.swift
//  YaBalaboba
//
//  Created by mvc on 06.02.2023.
//

import Foundation
import RealmSwift

protocol LocalStorageService {
    /// Сохранить сгенерированый текст
    func saveResponse(_ data: Response)
    
    /// Получить записи
    func getResponseList() -> [Response]
}

class ILocalStorageService: LocalStorageService {
    
    func saveResponse(_ data: Response) {
        let realm = try! Realm()
        do {
            try realm.write({
                realm.add(data.toTextBalaboba())
            })
        } catch {
            print("Error Realm: \(error.localizedDescription)")
        }
    }
    
    
    func getResponseList() -> [Response] {
        let realm = try! Realm()
        return realm
                .objects(TextBalaboba.self)
                .toArray()
                .compactMap({ Response(model: $0) })
    }
    
}
