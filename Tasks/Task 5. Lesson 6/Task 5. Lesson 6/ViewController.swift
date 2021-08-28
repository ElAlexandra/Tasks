//
//  ViewController.swift
//  Task 5. Lesson 6
//
//  Created by Александра  Значёнок on 29.06.21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let student: StudentInfo = StudentInfo( firstName: "Alexandra",
                                                lastName: "Znachenok",
                                                date: 1997,
                                                mark: 8)
        
        print(student.firstName, student.lastName, student.date, student.mark)
        
        
        
      
        
        let student1: StudentInfo = StudentInfo(firstName: "Александра", lastName: "Значёнок", date: 1997, mark: 8)
        let student2: StudentInfo = StudentInfo(firstName: "Андрей", lastName: "Трофимов", date: 1991, mark: 9)
        let student3: StudentInfo = StudentInfo(firstName: "Иван", lastName: "Васильев", date: 1993, mark: 7)
        let student4: StudentInfo = StudentInfo(firstName: "Катерина", lastName: "Исаева", date: 1995, mark: 5)
        let student5: StudentInfo = StudentInfo(firstName: "Лена", lastName: "Гайделёнис", date: 1990, mark: 8)
        let student6: StudentInfo = StudentInfo(firstName: "Максим", lastName: "Пушкин", date: 1995, mark: 4)
        let student7: StudentInfo = StudentInfo(firstName: "Петя", lastName: "Петухов", date: 1999, mark: 10)
        let student8: StudentInfo = StudentInfo(firstName: "Тимофей", lastName: "Митюшин", date: 1989, mark: 6)
        
        print(student1.firstName, student1.lastName, student1.date, student1.mark)
        print(student2.firstName, student2.lastName, student2.date, student2.mark)
        print(student3.firstName, student3.lastName, student3.date, student3.mark)
        print(student4.firstName, student4.lastName, student4.date, student4.mark)
        print(student5.firstName, student5.lastName, student5.date, student5.mark)
        print(student6.firstName, student6.lastName, student6.date, student6.mark)
        print(student7.firstName, student7.lastName, student7.date, student7.mark)
        print(student8.firstName, student8.lastName, student8.date, student8.mark)
       
        
        let all = [student1, student2, student3, student4, student5, student6, student7, student8]
        
        
        // вообще не знаю как сделать дальше, ломаю голову уже второй день, не могли написать здесь хотя бы 1 вариант решения
        
        
        
    
        
//        let std1 = student1.mark
//        let std2 = student1.mark
//        let std3 = student1.mark
//        let std4 = student1.mark
//        let std5 = student1.mark
//        let std6 = student1.mark
//        let std7 = student1.mark
//        let std8 = student1.mark

        
//        if std1 <= 8 {
//            print(student1.firstName, student.lastName, student.date, student.mark, " не проходит в следующий семестр")
//            if std2 <= 8 {
//                print(student2.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                if std3 <= 8 {
//                    print(student3.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                    if std4 <= 8 {
//                        print(student4.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                        if std5 <= 8 {
//                            print(student5.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                            if std6 <= 8 {
//                                print(student6.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                                if std7 <= 8 {
//                                    print(student7.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                                    if std8 <= 8 {
//                                        print(student8.firstName, student.lastName, student.date, student.mark, "не проходит в следующий семестр")
//                    } else {
//                        print(student1.firstName, student1.lastName, student1.date, student1.mark, student2.firstName, student2.lastName, student2.date, student2.mark, student3.firstName, student3.lastName, student3.date, student3.mark, student4.firstName, student4.lastName, student4.date, student4.mark, student5.firstName, student5.lastName, student5.date, student5.mark, student6.firstName, student6.lastName, student6.date, student6.mark, student7.firstName, student7.lastName, student7.date, student7.mark, student8.firstName, student8.lastName, student8.date, student8.mark, "проходят в следующий семестр")
//
//
//
//
//
//                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }

            
            
//                        if std1 <= 8 {
//                            print(student1.firstName, student.lastName, student.date, student.mark, "проходит в следующий семестр" )
//                            print("\(student1) не проходит в следующий семестр")
//                            if std2 <= 8 {
//                            print("\(student2) не проходит в следующий семестр")
//                                if std3 <= 8 {
//                                print("\(student3) не проходит в следующий семестр")
//                                    if std4 <= 8 {
//                                        print("\(student4) не проходит в следующий семестр")
//                                        if std5 <= 8 {
//                                            print("\(student5) не проходит в следующий семестр")
//                                            if std6 <= 8 {
//                                                print("\(student6) не проходит в следующий семестр")
//                                                if std7 <= 8 {
//                                                    print("\(student7) не проходит в следующий семестр")
//                                                    if std8 <= 8 {
//                                                        print("\(student8) не проходит в следующий семестр")
//                                    } else {
//                                        print("\(student1), \(student2), \(student3), \(student4), \(student5), \(student6), \(student7), \(student8)  проходят в следующий семестр")
//
        
        
        
//        let group: Group = Group( number: 16,
//                                  name: ["Александра Значёнок","Андрей Трофимов","Евгений Кошечкин","Иван Васильев","Катерина Исаева","Лена Гайделёнис","Максим Пушкин","Петя Петухов","Тимофей Митюшин"])
//
//
//        group.group()
//
    
        
        
        
        
        
        
        
        
        
        
        
        
//        var animals = ["cats", "dogs", "chimps", "moose"]
//
//        animals.remove(at: 2)
//        print(animals)
        
        
       
        
        
    }


}

