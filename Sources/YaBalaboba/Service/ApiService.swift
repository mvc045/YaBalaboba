//
//  BalabobaApi.swift
//  YaBalaboba
//
//  Created by mvc on 20.01.2023.
//

import Foundation
import ObjectMapper

protocol BalabobaApiService {
    /// Получаем Темы
    func getGenreList(_ onComlplection: @escaping (IntroList?, Error?)->())
    
    /// Генерируем текст
    func getText(query: String, genreId: Int, _ onComlplection: @escaping (Response?, Error?)->())
}

class IBalabobaApiService: ApiService, BalabobaApiService {
    
    private let host = "https://zeapi.yandex.net/lab/api/yalm"
    
    func getGenreList(_ onComlplection: @escaping (IntroList?, Error?) -> ()) {
        let path = host + "/intros"
        fetch(url: path, method: .GET) { (data, error) in
            guard let response = data,
                  let dict = try? JSONSerialization.jsonObject(with: response, options: .allowFragments) as? [String:Any] else {
                onComlplection(nil, error)
                return
            }
            let requests = Mapper<IntroList>().map(JSON: dict)
            onComlplection(requests, error)
        }
    }
    
    func getText(query: String, genreId: Int, _ onComlplection: @escaping (Response?, Error?) -> ()) {
        let path = host + "/text3"
        let body = [
            "intro": genreId,
            "query": query
        ] as [String : Any]
        fetch(url: path, method: .POST, body: body) { (data, error) in
            guard let response = data,
                  let dict = try? JSONSerialization.jsonObject(with: response, options: .allowFragments) as? [String:Any] else {
                onComlplection(nil, error)
                return
            }
            let requests = Mapper<Response>().map(JSON: dict)
            onComlplection(requests, error)
        }
    }
    
}

class ApiService {
    
    enum Method: String {
        case GET = "GET"
        case POST = "POST"
    }
    
    typealias Handler = (Data?, Error?) -> Void
    
    func fetch(url: String, method: Method = .GET, headers: [String:String]? = nil, body: [String:Any]? = nil, _ complection: @escaping Handler) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if let body = body, let bodyData = try? JSONSerialization.data(withJSONObject: body) {
            request.httpBody = bodyData
        }
        URLSession.shared.configuration.shouldUseExtendedBackgroundIdleMode = true
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                complection(nil, error)
                return
            }
            complection(data, nil)
        }.resume()
    }
    
}
