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
        scrollView.turnIntoAList(of: [])
        return scrollView
    }()
    private let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.items = [UITabBarItem(title: "a", image: nil, selectedImage: nil),
                        UITabBarItem(title: "b", image: nil, selectedImage: nil),
                        UITabBarItem(title: "c", image: nil, selectedImage: nil)]
        tabBar.barTintColor = .white
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    override func loadView() {
        super.loadView()
        setup()
    }
    func setupView() {
        view.backgroundColor = .systemPurple
        view.addSubviews([scrollView, tabBar])
    }
    func setupConstraints() {
        [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach {$0.isActive = true}
    }
}
