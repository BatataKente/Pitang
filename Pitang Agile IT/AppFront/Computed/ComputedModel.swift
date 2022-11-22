//
//  ComputedModel.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 01/09/1401 AP.
//

import Foundation

class Person {
    let name = "Josicleison"
    let age = 18
    let heightInFeet = 6
    var podeSerPreso:Bool {
        return age >= 18 && heightInFeet >= 6
    }
    init() {}
}

struct Employee {
    let name: String
    var annualSalary: Double
    let weeksPerYear: Int
    let hoursPerDay: Double
    var weeklySalary: Double {
        get {
            return annualSalary/Double(weeksPerYear)
        }
    }
    var hourlyWage: Double {
        get {
            return annualSalary/Double(weeksPerYear)/(hoursPerDay*5)
        }
        set {
            annualSalary = newValue*hoursPerDay*5*Double(weeksPerYear)
        }
    }
}
