//
//  TestViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class TextViewController: UIViewController {
    private lazy var leftTextView: UITextView = {
        let leftTextView = UITextView()
        leftTextView.backgroundColor = .blue
        leftTextView.translatesAutoresizingMaskIntoConstraints = false
        return leftTextView
    }()
    private lazy var text: (view: UITextView, estimatedSize: (() -> CGSize)) = {
        let textView = UITextView()
        textView.text = "Default Text"
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.backgroundColor = .lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        let estimatedSize = {() -> CGSize in
            textView.sizeThatFits(CGSize(width: self.view.frame.width, height: .infinity))
        }
        return (view: textView, estimatedSize: estimatedSize)
    }()
    override func loadView() {
        super.loadView()
        view.backgroundColor = .darkText
        view.addSubviews([text.view, leftTextView])
        [
            leftTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leftTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leftTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            leftTextView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.bottomAnchor),
            
            text.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            text.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.view.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ].forEach{$0.isActive = true}
        textViewDidChange(text.view)
    }
}

extension TextViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textView.constraints.forEach {constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = text.estimatedSize().height
            }
        }
    }
}
