//
//  TextBalaboba.swift
//  BalabobaExample
//
//  Created by mvc on 06.02.2023.
//

import Foundation
import RealmSwift

public class TextBalaboba: Object {
    /// Запрос
    @Persisted var query: String?
    /// Ответ
    @Persisted var text: String?
    /// Жанр
    @Persisted var intro: Int?
}
