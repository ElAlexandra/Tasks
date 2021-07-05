//
//  ViewController.swift
//  Task6. Lesson 7
//
//  Created by Александра  Значёнок on 2.07.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Task 1
        
        let artist: Artists = Artists(firstName: "Anna", lastName: "Bond")
        let artist1: Artists = Dancer(firstName: "Ivan", lastName: "Ivanov")
        let artist2: Artists = Singer(firstName: "Alex", lastName: "Alexev")
        let artist3: Artists = Painter(psevdo: "Kartman", firstName: "Pavel", lastName: "Durov")
        
        
        let massOfArtists: [Artists] = [artist, artist1, artist2, artist3]
    
        for methode in massOfArtists {
            methode.perfomance()
        }
        
        
        
        // Task 2
        
        let plane: Vehicle = Plane(numberOfVehicles: 2, speed: 500, capacity: 200, price: 6000)
        let ship: Vehicle = Ship(numberOfVehicles: 1, speed: 150, capacity: 400, price: 3000)
        let helicopter: Vehicle = Helicopter(numberOfVehicles: 10, speed: 450, capacity: 10, price: 5500)
        let car: Vehicle = Car(numberOfVehicles: 23, speed: 120, capacity: 4, price: 1000)
        
        let massOfVehicle: [Vehicle] = [plane, ship, helicopter, car]
        
        
        for varietyOfShipping in massOfVehicle {
            varietyOfShipping.shipping()
        }
        
     
        
        // Task 3
        
        
        let human1: People = People(lastName: "Znachenok", name: "Alexandra", numberOfLegs: 2, object: "Human")
        let human2: People = People(lastName: "Nonna", name: "Barbakadze", numberOfLegs: 2, object: "Human")

        let crocodile1: Crocodiles = Crocodiles(name: "Alligator", numberOfLegs: 4, object: "Animal")
        let crocodile2: Crocodiles = Crocodiles(name: "Reptile", numberOfLegs: 4, object: "Animal")

        let monkey1: Monkey = Monkey(name: "Orangutan", numberOfLegs: 2, object: "Animal")
        let monkey2: Monkey = Monkey(name: "Toque", numberOfLegs: 2, object: "Animal")

        let dog1: Dogs = Dogs(name: "Doberman", numberOfLegs: 4, object: "Animal")
        let dog2: Dogs = Dogs(name: "BullTerrier", numberOfLegs: 4, object: "Animal")

        let giraffe1: Giraffes = Giraffes(name: "Jojo", numberOfLegs: 4, object: "Animal")
        let giraffe2: Giraffes = Giraffes(name: "Ebola", numberOfLegs: 4, object: "Animal")


        let massOfHuman: [Crocodiles] = [human1, human2, crocodile1, crocodile2, monkey1, monkey2, dog1, dog2, giraffe1, giraffe2]

        for present in massOfHuman {
            present.show()
        }

        for leg in massOfHuman {
            if leg.numberOfLegs >= 4 {
            print("Я животное, у меня 4 лапы")
            } else {
               print("Я человек, у меня 2 ноги")
                }
            
        }
     
      
        
        
       
        
    }




}

