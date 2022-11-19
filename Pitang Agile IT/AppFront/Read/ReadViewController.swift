//
//  ReadViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

class ReadViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view.backgroundColor = .yellow
        struct Jason: Codable {
            let type: String?
            let coordinates: [String]
        }
        print(Network.read(Jason.self, from: "Jason") as Any)
    }
}
