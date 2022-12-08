//
//  Background.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

extension CALayer {
    func addGradientBackground(colors: [CGColor] = [UIColor.systemGreen.cgColor,
                                                    UIColor.systemGreen.cgColor,
                                                    UIColor.green.cgColor]) {
        removeSubLayers(ofType: CAGradientLayer.self)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        insertSublayer(gradient, at: 0)
    }
}
