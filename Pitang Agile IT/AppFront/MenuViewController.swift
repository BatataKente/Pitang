//
//  CrazyView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 18/08/1401 AP.
//

import UIKit
import SwiftUI

final class MenuViewController: UIViewController {
    private let viewControllers = [MoviesViewController(),
                                   ClousuresViewController(),
                                   LazyViewController(),
//                                   PickerViewController(),
                                   CicleViewController(),
                                   ReadViewController(),
                                   ScrollViewController(),
                                   ObserveViewController(),
                                   AudioBookViewController(),
                                   BookViewController(),
                                   AnimatedViewController(),
                                   ComputedViewController(),
                                   TextViewController(),
                                   UIHostingController(rootView: ClousuresView())]
    private lazy var table: (view: UITableView, cellReuseIdentifier: String) = {
        let identifier = "Cell"
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        return (view: tableView, cellReuseIdentifier: identifier)
    }()
    override func loadView() {
        super.loadView()
        setup()
    }
}

extension MenuViewController: Setup {
    func configute() {
        title = "Main Menu"
        view.addSubview(table.view)
        view.backgroundColor = .systemGreen
    }
    func constrain() {
        table.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewControllers[indexPath.row], animated: true)
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        let label = Create.label("\(type(of: viewControllers[indexPath.row]))", alignment: .center)
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
        return cell
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/15
    }
}
