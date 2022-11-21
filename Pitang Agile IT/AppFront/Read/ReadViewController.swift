//
//  ReadViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

class ReadViewController: UIViewController {
    private let label = Create.label("Read-Me", font: Assets.font(30),
                                     alignment: .center)
    private let rtfFormat = [NSAttributedString.DocumentReadingOptionKey.documentType:
                                NSAttributedString.DocumentType.rtf]
    private let stack: UIStackView = {
        
        let firstBbutton = Create.button("Tap-Me") {_ in
            print("Toma!")
        }
        firstBbutton.backgroundColor = .lightGray
        
        let secondBbutton = Create.button("I have a dream") {_ in
            print("Toma!")
        }
        secondBbutton.backgroundColor = .lightGray
        
        let label = Create.label("Read-Me", font: Assets.font(20),
                                 alignment: .center)
        
        let stack = UIStackView(arrangedSubviews: [firstBbutton, secondBbutton, label])
        stack.axis = .vertical
        
        return stack
    }()
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = Assets.Colors.reverseDark
        textView.textColor = Assets.Colors.normalDark
        textView.font = Assets.font(25)
        textView.text = ""
        return textView
    }()
    override func loadView() {
        super.loadView()
        print(Network.read(Jason.self, from: "Jason") as Any)
        setup()
        showBatata(file: "Batatinha")
        textView.text.append("\n\n")
        showBatata(file: "Batatas")
    }
    private func showBatata(file name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "rtf") else {return}
        
        guard let text = try? NSMutableAttributedString(url: url, options: rtfFormat, documentAttributes: .none) else {return}
        textView.text.append(text.string)
    }
}

extension ReadViewController: Setup {
    func setupView() {
        title = "\(type(of: self))"
        view.backgroundColor = Assets.Colors.normalDark
        view.addSubviews([label, textView, stack])
    }
    func setupConstraints() {
        label.constraint([.leading, .trailing, .top], to: view.safeAreaLayoutGuide)
        textView.constraint(attributesAttributes: [.top: .bottom], to: label)
        textView.constraint([.leading, .trailing], to: view.safeAreaLayoutGuide)
        textView.constraint(attributesAttributes: [.bottom: .top], to: stack)
        stack.constraint([.leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}
