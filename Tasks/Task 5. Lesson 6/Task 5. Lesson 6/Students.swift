//
//  Student.swift
//  Task 5. Lesson 6
//
//  Created by Александра  Значёнок on 29.06.21.
//

import Foundation

class StudentInfo {
    
    let firstName: String
    let lastName: String
    let date: Int
    let mark: Int
    
    init(firstName: String, lastName: String, date: Int, mark: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.date = date
        self.mark = mark
}
}

class Group {
    
    let number: Int
    var students: [StudentInfo] = []
    
    init(number: Int) {
        self.number = number
}
    func group() {
        print("Студенты \(number) группы - это \(students)")

    }
    
    
    
    
}
