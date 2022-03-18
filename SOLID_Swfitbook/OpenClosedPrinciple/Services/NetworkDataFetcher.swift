//
//  NetworkDataFetcher.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import Foundation

protocol DataFetcher {
    func fetch<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking!
    
    init(networking: Networking = NetworkService2()) {
        self.networking = networking
    }
    
    func fetch<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
        networking.request(urlString: urlString) { data, response in
            guard let data = data else { return }
            let decoded = self.decodeJSON(type: T.self, from: data)
            completion(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch {
            print(error)
            return nil
        }
    }
}
