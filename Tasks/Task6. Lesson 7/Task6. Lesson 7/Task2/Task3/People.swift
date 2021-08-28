//
//  People.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class People: Crocodiles {

    var lastName: String
    
    init(lastName: String, name: String, numberOfLegs: Int, object: String){
        self.lastName = lastName
        super.init(name: name, numberOfLegs: numberOfLegs, object: object) }
    
    override func show() {
        print("Я человек и меня зовут \(name) \(lastName), у меня \(numberOfLegs) ноги и я \(object)")
    }

}
