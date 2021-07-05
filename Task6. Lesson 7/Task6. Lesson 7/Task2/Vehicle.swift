//
//  Vehicle.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Vehicle {
    var speed: Int
    var capacity: Int
    var price: Int
    
    init(speed: Int, capacity: Int, price: Int) {
        self.speed = speed
        self.capacity = capacity
        self.price = price
 
    }
    
    func shipping() {
        print("Количество пассажиров - \(capacity) и стоимость поездки - \(price)")
    }
    
}

