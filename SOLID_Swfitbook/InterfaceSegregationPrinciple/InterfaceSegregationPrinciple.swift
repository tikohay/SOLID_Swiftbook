//
//  InterfaceSegregationPrinciple.swift
//  SOLID_Swfitbook
//
//  Created by Karakhanyan Tigran on 19.03.2022.
//

import Foundation

//InterfaceSegregationPrinciple

protocol Birds {
    func fly()
    func swim()
}

protocol Flyable {
    func fly()
}

protocol Swimming {
    func swim()
}

//class Bird: Birds {
//
//    func fly() {
//        print("i can fly")
//    }
//
//    func swim() {
//        print("i can swim")
//    }
//}

class Duck: Flyable, Swimming {
    
    func fly() {
        print("i can fly a lot")
    }
    
    func swim() {
        print("i can swim a lot")
    }
}

class Pinguin: Swimming {
    
    func swim() {
        fatalError()
    }
}
