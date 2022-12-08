//
//  Hierarchy.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

extension UIView {
    func removeSubViews(if condition: Bool = true) {
        for subview in subviews where condition {
            subview.removeFromSuperview()
        }
    }
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

