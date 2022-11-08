//
//  ViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesView: UIViewController {
    
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
        
        if let imageView = tableView.cellForRow(at: indexPath)?.contentView.subviews.last as? UIImageView {
            
            navigationController?.pushViewController(MovieDetailsView(movies?[indexPath.row], movieImage: imageView.image), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellReuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = .white
        
        let label = Create.label(movies?[indexPath.row].name)
        label.backgroundColor = .white
        
        let arrowImageView = Create.imageView(Assets.Images.right)
        arrowImageView.tintColor = .black
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        cell.contentView.addSubviews([label, arrowImageView, line])
        
        Task {
            
            let data = await Network.call(from: movies?[indexPath.row].url ?? "")
            
            if let data = data {
                
                let movieImageView = UIImageView(image: UIImage(data: data))
                
                cell.contentView.addSubview(movieImageView)
                
                movieImageView.constraint(attributes_constants: [.leading: 20, .top: 10, .bottom: -10])
                movieImageView.constraint(attributes_attributes: [.width: .height], to: movieImageView)
            }
        }
        
        label.constraint(attributes_constants: [.top: 0, .bottom: 0,
                                                .leading: cell.contentView.frame.height*1.2,
                                                .trailing: -cell.contentView.frame.height*1.2])
        
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
