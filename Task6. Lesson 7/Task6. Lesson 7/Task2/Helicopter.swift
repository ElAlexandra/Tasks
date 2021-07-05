//
//  Helicopter.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Helicopter: Vehicle {
    
    
    var numberOfVehicles: Int
    
    init(numberOfVehicles: Int, speed: Int, capacity: Int, price: Int) {
        self.numberOfVehicles = numberOfVehicles
        super.init(speed: speed, capacity: capacity, price: price)
    }
    
    override func shipping() {
        print("Вместимость вертолёта \(capacity) пассажиров и стоимость поездки - \(price), скорость вертолёта \(speed), количество вертолётов, необходимое для осуществления маршрута - \(numberOfVehicles)")
    }
}

