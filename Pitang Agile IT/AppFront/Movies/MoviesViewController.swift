//
//  ViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var movies: Movies? = nil
    
    private let table: (view: UITableView, cellReuseIdentifier: String) = {
        
        let identifier = "Cell"
        
        let tableView = UITableView()
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.backgroundColor = .white
        
        return (view: tableView, cellReuseIdentifier: identifier)
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "\(type(of: self))"
        
        view.backgroundColor = .systemPurple
        view.addSubview(table.view)
        
        table.view.dataSource = self
        table.view.delegate = self
        
        table.view.constraint([.top, .leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
        
        Task {[weak self] in
             
            guard let data = await Network.call(from: "https://api.themoviedb.org/3/movie/popular?api_key=caf1ab0511589bd064968e2fabd2e42b") else {return}
            
            self?.movies = Network.decode(Movies.self, from: data)
            self?.table.view.reloadData()
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.isUserInteractionEnabled = false
        navigationController?.pushViewController(MovieDetailsViewController(movies?.results?[indexPath.row]), animated: true)
        tableView.isUserInteractionEnabled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: table.cellReuseIdentifier, for: indexPath) as? MoviesTableViewCell else {return UITableViewCell()}
        cell.contentView.backgroundColor = .white
        
        cell.setup(result: movies?.results?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height*0.08
    }
}
