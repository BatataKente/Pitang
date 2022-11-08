//
//  ViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class Movies: UIViewController {
    
    private let table: (view: UITableView, cellReuseIdentifier: String) = {
        
        let identifier = "Cell"
        
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.backgroundColor = .white
        
        return (view: tableView, cellReuseIdentifier: identifier)
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "\(type(of: self))"
        
        view.backgroundColor = .systemIndigo
        view.addSubview(table.view)
        
        table.view.dataSource = self
        table.view.delegate = self
        
        table.view.constraint([.top, .leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}

extension Movies: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellReuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = .white
        
        let movieImageView = Create.imageView()
        movieImageView.backgroundColor = .lightGray
        
        let label = Create.label("Titulo Filme")
        
        let arrowImageView = Create.imageView(Assets.Images.right)
        arrowImageView.tintColor = .black
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        cell.contentView.addSubviews([movieImageView, label, arrowImageView, line])
        
        movieImageView.constraint(attributes_constants: [.leading: 20, .top: 10, .bottom: -10])
        movieImageView.constraint(attributes_attributes: [.width: .height], to: movieImageView)
        
        label.constraint([.centerY])
        label.constraint(attributes_attributes: [.leading: .trailing], to: movieImageView, by: 20)
        
        arrowImageView.constraint(attributes_constants: [.centerY: 0, .trailing: -20])
        arrowImageView.shape(size: cell.frame.height*0.3)
        
        line.constraint(attributes_constants: [.leading: 10, .trailing: -10, .bottom: 0])
        line.shape(height: 2)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height*0.08
    }
}
