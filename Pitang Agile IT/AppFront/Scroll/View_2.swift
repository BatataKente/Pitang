//
//  View_2.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

class View_2: UIView, Setup {
    private let label = Create.label("Lero Lero")
    private let leftImage = Create.imageView(Assets.Images.left, color: .systemPink)
    private let rightImage = Create.imageView(Assets.Images.right, color: .systemPink)
    init(height: CGFloat = 100) {
        super.init(frame: .zero)
        setup()
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configute() {
        addSubviews([leftImage, label, rightImage])
    }
    func constrain() {
        leftImage
            .constraint(attributes: [.top, .leading, .bottom])
            .constraint(attribute: .width, multiplier: 1/3)
        label
            .constraint(attributes: [.top, .bottom, .centerX])
        rightImage
            .constraint(attributes: [.top, .trailing, .bottom])
            .constraint(attribute: .width, multiplier: 1/3)
    }
}
