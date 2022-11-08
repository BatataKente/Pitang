//
//  ViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesView: UIViewController {
    
    private let moviesViewModel = MoviesViewModel()
    
    private var movies: [Movie]? = nil
    
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
        
        Task {[weak self] in
             
            guard let data = await Network.call(from: "https://desafio-mobile-pitang.herokuapp.com/movies/list?page=0&size=0") else {return}
            
            self?.movies = Network.decode([Movie].self, from: data)
            self?.table.view.reloadData()
        }
    }
}

extension MoviesView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.isUserInteractionEnabled = false
        navigationController?.pushViewController(MovieDetailsView(movies?[indexPath.row]), animated: true)
        tableView.isUserInteractionEnabled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellReuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = .white
        
        moviesViewModel.setup(cell: cell, movie: movies?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height*0.08
    }
}
