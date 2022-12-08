//
//  ScrollViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 03/09/1401 AP.
//

import UIKit

final class ScrollViewController: UIViewController, Setup {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.turnIntoAList(of: [View_1(),
                                      View_2(),
                                      View_3(["Lero Lero", "Eu tenho a força"]),
                                      Create.label("R$ 1.000.000,00"),
                                      Create.label("a"),
                                      Create.label("b"),
                                      Create.label("c"),
                                      Create.label("d"),
                                      Create.label("e"),
                                      Create.label("f"),
                                      View_4()]).spacing = 20
        return scrollView
    }()
    override func loadView() {
        super.loadView()
        title = "\(type(of: self))"
        setup()
    }
    func configute() {
        scrollView.delegate = self
        view.backgroundColor = .systemPurple
        view.addSubview(scrollView)
    }
    func constrain() {
        [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach {$0.isActive = true}
    }
}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        for subview in scrollView.subviews {
            if subview.frame.origin.x != 0 {
                subview.subviews.first?.backgroundColor = .systemPurple
            }
        }
    }
}
