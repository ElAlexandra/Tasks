//
//  Сrocodiles.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Crocodiles {
   
    var name: String
    var numberOfLegs: Int
    var object: String
    
    init(name: String, numberOfLegs: Int, object: String) {
    
        self.name = name
        self.numberOfLegs = numberOfLegs
        self.object = object
    }
        func show() {
        print("Я крокодил и меня зовут \(name), у меня \(numberOfLegs) ноги и я \(object)")
}
}

