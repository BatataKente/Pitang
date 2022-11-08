//
//  MoviewDetails.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MovieDetailsView: UIViewController {
    
    private var movie: Movie?
    
    private let movieTitleLabel: UILabel
    
    init(_ movie: Movie?) {
        
        self.movie = movie
        self.movieTitleLabel = Create.label(movie?.name, color: .white,
                                            font: Assets.font(30),
                                            alignment: .center)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private let movieImageView = Create.imageView()
    
    private let movieDescriptionLabel = Create.label("aaaaaaaaaaa", color: .white,
                                                     font: Assets.font(15))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "\(type(of: self))"
        
        view.backgroundColor = .red
        view.addSubviews([movieTitleLabel, movieImageView, movieDescriptionLabel])
        
        movieTitleLabel.constraint(attributes_constants: [.top: 10, .leading: 0, .trailing: 0], to: view.safeAreaLayoutGuide)
        
        movieImageView.constraint(attributes_attributes: [.top: .bottom], to: movieTitleLabel, by: view.frame.height*0.05)
        movieImageView.constraint([.centerX])
        movieImageView.shape(size: view.frame.width*0.7)
        
        movieDescriptionLabel.constraint(attributes_attributes: [.top: .bottom], to: movieImageView, by: view.frame.height*0.05)
        movieDescriptionLabel.constraint(attributes_constants: [.leading: 40, .trailing: -40], to: view.safeAreaLayoutGuide)
        
        Task {
            
            guard let data = await Network.call(from: movie?.url) else {return}
            
            self.movieImageView.image = UIImage(data: data)
        }
    }
}
