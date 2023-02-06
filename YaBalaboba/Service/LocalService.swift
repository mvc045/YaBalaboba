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
    
    /// Получить, последние N записей
    func getResponseList(offset: Int) -> [Response]
}

class ILocalStorageService: LocalStorageService {
    
    var realm: Realm!
    
    init() {
        realm = try! Realm()
    }
    
    func saveResponse(_ data: Response) {
        try? realm.write({
            realm.add(data.toTextBalaboba())
        })
    }
    
    
    func getResponseList(offset: Int = 10) -> [Response] {
        return realm
                .objects(TextBalaboba.self)
                .toArray()
                .compactMap({ Response(model: $0) })
    }
    
}
