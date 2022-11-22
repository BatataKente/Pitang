//
//  ObserveViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 30/08/1401 AP.
//

import UIKit

class ObserveViewController: UIViewController {
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .systemMint
        
        var persona = Persona(firstName: "Josicleison")
        
        persona.firstName = "Elves"
    }
}
