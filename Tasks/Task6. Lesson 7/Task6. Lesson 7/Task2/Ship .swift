//
//  Ship .swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Ship: Vehicle {
 
    var numberOfVehicles: Int
    
    init(numberOfVehicles: Int, speed: Int, capacity: Int, price: Int) {
        self.numberOfVehicles = numberOfVehicles
        super.init(speed: speed, capacity: capacity, price: price)
    }
    
    
    override func shipping() {
        print("Вместимость коробля - \(capacity) пассажиров и стоимость поездки - \(price), скорость корабля \(speed), количество самолётов, необходимое для осуществления маршрута - \(numberOfVehicles)")
    }
}

