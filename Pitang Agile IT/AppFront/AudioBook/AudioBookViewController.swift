//
//  AudiobookViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 21/08/1401 AP.
//

import UIKit

class AudioBookViewController: UIViewController {
    override func loadView() {
        super.loadView()
        title = "Audiobooks"
        view.backgroundColor = .red
        Task {
            guard let data = await Network.call(from: "https://odysee.com/$/playlist/a5686e2b8ab24f2b25a1523c31642e60001b9c67") else {return}
            print(String(data: data, encoding: .utf8))
        }
    }
}
