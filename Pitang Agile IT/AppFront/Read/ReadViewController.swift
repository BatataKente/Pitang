//
//  ReadViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

class ReadViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .yellow
        
//        print(Network.read(Bible.self, from: "Jason") as Any)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
