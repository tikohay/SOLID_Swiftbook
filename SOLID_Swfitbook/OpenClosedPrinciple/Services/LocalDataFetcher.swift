//
//  LocalDataFetcher.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 19.03.2022.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetch<T>(urlString: String, completion: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else { print("couldn't find \(urlString) in main bundle")
            completion(nil)
            return
        }
        let data = try? Data(contentsOf: file)
        
        let decoded = self.decodeJSON(type: T.self, from: data)
        completion(decoded)
    }
}
