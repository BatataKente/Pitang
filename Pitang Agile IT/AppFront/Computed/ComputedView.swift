//
//  ComputedView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 03/09/1401 AP.
//

import UIKit

final class ComputedView: UIView {
    
    var score = "0"
    
    private let label = Create.label()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
