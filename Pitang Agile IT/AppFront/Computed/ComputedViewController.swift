//
//  ComputedViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 25/08/1401 AP.
//

import UIKit

class Person {
    let name = "Josicleison"
    let age = 18
    let heightInFeet = 6
    var podeSerPreso:Bool {
        return age >= 18 && heightInFeet >= 6
    }
    init() {}
}

class ComputedViewController: UIViewController {
    let josicleison = Person()
    var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    override func loadView() {
        super.loadView()
        view.backgroundColor = .green
        if josicleison.podeSerPreso {
            print("\(josicleison.name) pode ser preso")
        }
        view.addSubview(button)
        button.constraint([.centerX,.centerY])
        button.shape(size: view.width/4)
        let customView = UIView(frame: CGRect(origin: CGPoint(x: 0,
                                                              y: view.bottom-50),
                                              size: CGSize(width: view.width,
                                                           height: 50)))
        customView.backgroundColor = .white
        view.addSubview(customView)
    }
}

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    var height: CGFloat {
        return frame.size.height
    }
    var bottom: CGFloat {
        return frame.maxY
    }
}
