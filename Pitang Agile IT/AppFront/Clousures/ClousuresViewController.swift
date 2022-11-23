//
//  ClousuresViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 19/08/1401 AP.
//

import UIKit

class ClousuresViewController: UIViewController {
    override func loadView() {
        super.loadView()
        title = "Clousures"
        view.backgroundColor = .systemRed
        students()
    }
    func students() {
        struct Student {
            let name: String
            let score: Int
        }
        let students = [Student(name: "Josicleison", score: 0),
                        Student(name: "Josicleide", score: 73),
                        Student(name: "Maria", score: 83),
                        Student(name: "Onofre", score: 30),
                        Student(name: "Marcidineia", score: 80),
                        Student(name: "Godolfredo", score: 50),
                        Student(name: "Alfredo", score: 60),
                        Student(name: "Proibildo", score: 86)]
        
        let _: (Student) -> Bool = {student in
            return student.score < 80
        }
//        let reprovedStudents = students.filter(topStudentFilter)
        let reprovedStudents = students.filter{$0.score < 80}
        let aprovedStudents = students.filter{$0.score > 80}
        let _ = students.sorted {$0.score > $1.score}
        for student in reprovedStudents {
            if student.name.last == "a" ||
               student.name.last == "e" {print("\(student.name) foi reprovada!"); continue}
            print("\(student.name) foi reprovado!")
        }
        print("")
        for student in aprovedStudents {
            if student.name.last == "a" ||
               student.name.last == "e" {print("\(student.name) foi aprovada!"); continue}
            print("\(student.name) foi aprovado!")
        }
    }
}
