//
//  Painter.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Painter: Artists {
    
    var psevdo: String
    
    init(psevdo: String, firstName: String, lastName: String) {
        self.psevdo = psevdo
        super.init(firstName: firstName, lastName: lastName)
    }
    
    
   override func perfomance() {
    print("Меня зовут \(firstName), \(lastName) но вы зовите меня \(psevdo)")
}
}
