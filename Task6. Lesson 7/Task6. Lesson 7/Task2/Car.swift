//
//  Car.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import Foundation

class Car: Vehicle {
    
    var numberOfVehicles: Int
    
    init(numberOfVehicles: Int, speed: Int, capacity: Int, price: Int) {
        self.numberOfVehicles = numberOfVehicles
        super.init(speed: speed, capacity: capacity, price: price)
    }
    
    override func shipping() {
        print("Машина вмещает \(capacity) пассажиров и стоимость поездки - \(price), скорость машины \(speed), количество машин, необходимое для осуществления маршрута - \(numberOfVehicles)")
    }
}
