//
//  ObserveModel.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import Foundation

struct Persona {
    var firstName: String {
        didSet {
            print("a new first name was set: \(firstName)!")
            self.lastName
        }
    }
    var lastName: String?
}
