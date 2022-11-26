//
//  Background.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

extension UIView {
    func addGradientBackground(colors: [CGColor] = [UIColor.systemGreen.cgColor,
                                                    UIColor.systemGreen.cgColor,
                                                    UIColor.green.cgColor]) {
        removeSubLayers(if: (layer as? CAGradientLayer) != nil)
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colors
        layer.insertSublayer(gradient, at: 0)
    }
}
