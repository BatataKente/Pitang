//
//  Setup.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/09/1401 AP.
//

import Foundation

protocol Setup {
    func configute()
    func constrain()
    func setup()
}

extension Setup {
    func constrain() {}
    func setup() {
        configute()
        constrain()
    }
}
