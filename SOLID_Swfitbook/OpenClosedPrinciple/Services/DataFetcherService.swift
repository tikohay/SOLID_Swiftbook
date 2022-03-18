//
//  DataFetcherService.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher!
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchGames(completion: @escaping (AppGroup?) -> Void) {
        let appsUrlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
        dataFetcher.fetch(urlString: appsUrlString, completion: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let countryUrlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetch(urlString: countryUrlString, completion: completion)
    }
}
