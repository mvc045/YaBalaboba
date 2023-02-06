//
//  Response.swift
//  YaBalaboba
//
//  Created by mvc on 20.01.2023.
//

import Foundation
import ObjectMapper

public struct Response: Mappable {
    
    public var bad_query: Int?
    public var query: String?
    public var text: String?
    public var error: Int?
    public var is_cached: Int?
    public var intro: Int?
    public var signature : String?

    public init?(map: Map) {}
    
    public init?(model: TextBalaboba) {
        query = model.query
        text = model.text
        intro = model.intro
    }
    
    mutating public func mapping(map: Map) {
        bad_query <- map["bad_query"]
        query <- map["query"]
        text <- map["text"]
        error <- map["error"]
        is_cached <- map["is_cached"]
        intro <- map["intro"]
        signature <- map["signature"]
    }
    
    
    // Response -> TextBalaboba
    func toTextBalaboba() -> TextBalaboba {
        let model = TextBalaboba()
        model.query = query
        model.text = text
        model.intro = intro
        return model
    }

}


