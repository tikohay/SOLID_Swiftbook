//
//  DataFetcherService.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchGames(completion: @escaping (AppGroup?) -> Void) {
        let appsUrlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        networkDataFetcher.fetch(urlString: appsUrlString, completion: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let countryUrlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetch(urlString: countryUrlString, completion: completion)
    }
    
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetch(urlString: localUrlString, completion: completion)
    }
}
