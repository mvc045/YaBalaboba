//
//  YaBalaboba.swift
//  YaBalaboba
//
//  Created by mvc on 06.02.2023.
//

import Foundation

public class YaBalaboba {

    private var localStorage: LocalStorageService
    private var apiService: BalabobaApiService
    
    public init() {
        localStorage = ILocalStorageService()
        apiService = IBalabobaApiService()
    }
    
}

//MARK: - API
extension YaBalaboba: BalabobaApiService {
    
    public func getGenreList(_ onComlplection: @escaping (IntroList?, Error?) -> ()) {
        apiService.getGenreList(onComlplection)
    }
    
    public func getText(query: String, genreId: Int, _ onComlplection: @escaping (Response?, Error?) -> ()) {
        apiService.getText(query: query, genreId: genreId) { data, error in
            onComlplection(data, error)
            guard let data = data else { return }
            self.saveResponse(data)
        }
    }
    
}


//MARK: - Local Storage (Realm)
extension YaBalaboba: LocalStorageService {
    
    func saveResponse(_ data: Response) {
        localStorage.saveResponse(data)
    }
    
    public func getResponseList(offset: Int) -> [Response] {
        return localStorage.getResponseList(offset: offset)
    }
    
}
