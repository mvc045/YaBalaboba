//
//  IntroList.swift
//  YaBalaboba
//
//  Created by mvc on 20.01.2023.
//

import Foundation
import ObjectMapper

public struct IntroList: Mappable {
    
    var intros: [[Any]]?
    public var ganre: [Genre]?
    public var error: Int?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        intros <- map["intros"]
        error <- map["error"]
        decodeAnyArray()
    }
    
    mutating func decodeAnyArray() {
        let result = intros?.compactMap({ decodeAnyToGanre($0) })
        ganre = result
    }
    
    mutating func decodeAnyToGanre(_ arr: [Any]) -> Genre {
        let id = arr[0] as? Int
        let name = arr[1] as? String
        let description = arr[2] as? String
        return Genre(id: id, name: name, description: description)
    }

}

public struct Genre {
    
    public var id: Int?
    public var name: String?
    public var description: String?
    
}
