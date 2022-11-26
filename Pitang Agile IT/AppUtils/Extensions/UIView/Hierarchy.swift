//
//  Hierarchy.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

extension UIView {
    func removeSubLayers() {
        guard let sublayers = layer.sublayers else {return}
        for layer in sublayers where (layer as? CAGradientLayer) != nil {
            layer.removeFromSuperlayer()
        }
    }
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
