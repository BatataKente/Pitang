//
//  TextViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class BookViewController: UIViewController {
    private var bible: Bible?
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = Assets.font(30)
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    init() {
        super.init(nibName: nil, bundle: nil)
        bible = Network.read(Bible.self, from: "Jason")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        setupView()
        setupConstraints()
    }
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(textView)
        if let verses = bible?.verses {
            for i in 0...verses.count-1 {
                textView.text.append("\(i + 1): \(verses[i].text ?? "")\n")
            }
        }
    }
    func setupConstraints() {
        textView.constraint(by: [.top,.leading,.trailing,.bottom], to: view.safeAreaLayoutGuide)
    }
}
