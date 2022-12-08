//
//  CicleViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/09/1401 AP.
//

import UIKit

final class CicleViewController: UIViewController {
    private let button = Create.button()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view.layer.addGradientBackground(colors: [UIColor.systemPink.cgColor,
                                                  UIColor.systemRed.cgColor,
                                                  UIColor.systemCyan.cgColor])
        view.addSubview(button)
        button.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
