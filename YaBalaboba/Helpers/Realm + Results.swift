//
//  Realm + Results.swift
//  YaBalaboba
//
//  Created by mvc on 06.02.2023.
//

import Foundation
import RealmSwift

extension Results {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}

extension RealmSwift.List {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}
