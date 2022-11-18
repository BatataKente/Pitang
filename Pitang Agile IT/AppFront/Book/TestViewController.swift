//
//  TestViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 26/08/1401 AP.
//

import UIKit

final class TextViewController: UIViewController {
    private lazy var text: (view: UITextView, estimatedSize: (() -> CGSize)) = {
        let textView = UITextView()
        textView.text = "Default Text"
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.delegate = self
        textView.isScrollEnabled = false
        let estimatedSize = {() -> CGSize in
            textView.sizeThatFits(CGSize(width: self.view.frame.width, height: .infinity))
        }
        return (view: textView, estimatedSize: estimatedSize)
    }()
    override func loadView() {
        super.loadView()
        view.backgroundColor = .darkText
        text.view.backgroundColor = .lightGray
        view.addSubview(text.view)
        
//        text.view.frame = CGRect(origin: CGPoint(x: view.frame.minX,
//                                                y: view.center.y),
//                                size: CGSize(width: view.frame.width,
//                                             height: view.frame.height*0.2))
        
        text.view.translatesAutoresizingMaskIntoConstraints = false
        [
//            text.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            text.view.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            text.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            text.view.heightAnchor.constraint(equalToConstant: 50)
        ].forEach{$0.isActive = true}
        
//        text.view.constraint([.top,.leading,.trailing], to: view.safeAreaLayoutGuide)
//        text.view.shape(height: 0)
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
