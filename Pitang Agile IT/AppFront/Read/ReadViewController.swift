//
//  ReadViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit
import SafariServices

class ReadViewController: UIViewController {
    private let label = Create.label("Read-Me", font: Assets.font(30),
                                     alignment: .center)
    private let rtfFormat = [NSAttributedString.DocumentReadingOptionKey.documentType:
                                NSAttributedString.DocumentType.rtf]
    private lazy var stack: UIStackView = {
        
        let firstBbutton = Create.button("Batatinha")
        firstBbutton.addTarget(self, action: #selector(buttonsTarget), for: .touchUpInside)
        firstBbutton.backgroundColor = .lightGray
        
        let secondBbutton = Create.button("Batatas")
        secondBbutton.addTarget(self, action: #selector(buttonsTarget), for: .touchUpInside)
        secondBbutton.backgroundColor = .lightGray
        
        let thirdyBbutton = Create.button("Go")
        thirdyBbutton.addTarget(nil, action: #selector(goButtonTarget), for: .touchUpInside)
        thirdyBbutton.backgroundColor = .systemBlue
        
        let label = Create.label("Read-Me", font: Assets.font(20),
                                 alignment: .center)
        
        let stack = UIStackView(arrangedSubviews: [firstBbutton, secondBbutton, thirdyBbutton, label])
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
    }
    private func showBatata(file name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "rtf") else {return}
        
        guard let text = try? NSMutableAttributedString(url: url, options: rtfFormat, documentAttributes: .none) else {return}
        textView.text = text.string
    }
    @objc func buttonsTarget(_ sender: UIButton) {
        
        showBatata(file: sender.currentTitle ?? "Batata")
    }
    @objc func goButtonTarget() {
        guard let url = URL(string: textView.text ?? "https://pt.wikipedia.org/wiki/Batata") else {return}
        let page = SFSafariViewController(url: url)
        navigationController?.navigate(to: page)
    }
}

extension ReadViewController: Setup {
    func configute() {
        title = "\(type(of: self))"
        view.backgroundColor = Assets.Colors.normalDark
        view.addSubviews([label, textView, stack])
    }
    func constrain() {
        label.constraint(attributes: [.leading, .trailing, .top], to: view.safeAreaLayoutGuide)
        textView.constraint(attributesAttributes: [.top: .bottom], to: label)
        textView.constraint(attributes: [.leading, .trailing], to: view.safeAreaLayoutGuide)
        textView.constraint(attributesAttributes: [.bottom: .top], to: stack)
        stack.constraint(attributes: [.leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}
