//
//  Artist.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Artists {
   var firstName: String
   var lastName: String
   
   
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        
    }
    func perfomance() {
        print("Меня зовут \(firstName), \(lastName) и я пока только учусь фокусам")
    }
}
