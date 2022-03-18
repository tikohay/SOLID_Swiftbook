//
//  DataStore.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 18.03.2022.
//

import Foundation

class DataStore2 {
    
    func saveNameInCache(name: String) {
        print("Your name is \(name) is saved")
    }
    
    func getNameFromCache() -> String {
        return "some name"
    }
}
