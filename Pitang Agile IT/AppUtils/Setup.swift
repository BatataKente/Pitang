//
//  Setup.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import Foundation

protocol Setup {
    func setupView()
    func setupConstraints()
    func setup()
}
extension Setup {
    func setup() {
        setupView()
        setupConstraints()
    }
}
