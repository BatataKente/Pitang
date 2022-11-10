//
//  MoviewDetails.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private let player = Player()
    
    private var movie: Movie?
    
    private let movieTitleLabel: UILabel
    
    private var movieImageView: UIImageView
    
    init(_ movie: Movie?, movieImage: UIImage?) {
        
        self.movie = movie
        self.movieTitleLabel = Create.label(movie?.name, color: .white,
                                            font: Assets.font(30),
                                            alignment: .center)
        self.movieImageView = Create.imageView(movieImage)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private let movieDescriptionLabel = Create.label(color: .white, font: Assets.font(15))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let playButton = Create.button("play") {_ in
            
            self.player.play("https://player.odycdn.com/api/v4/streams/free/Berserk13/51911083d759ab4a8b20bd6813400b6df14cabd7/ff1053", videoContent: self.view)
        }
        
        title = "\(type(of: self))"
        
        view.backgroundColor = .systemIndigo
        view.addSubviews([movieTitleLabel, movieImageView, movieDescriptionLabel, playButton])
        
        movieTitleLabel.constraint(attributes_constants: [.top: 10, .leading: 0, .trailing: 0], to: view.safeAreaLayoutGuide)
        
        movieImageView.constraint(attributes_attributes: [.top: .bottom], to: movieTitleLabel, by: view.frame.height*0.05)
        movieImageView.constraint([.centerX])
        movieImageView.shape(size: view.frame.width*0.7)
        
        movieDescriptionLabel.constraint(attributes_attributes: [.top: .bottom], to: movieImageView, by: view.frame.height*0.05)
        movieDescriptionLabel.constraint(attributes_constants: [.leading: 40, .trailing: -40], to: view.safeAreaLayoutGuide)
        
        playButton.constraint([.centerX, .bottom], to: view.safeAreaLayoutGuide)
        
        Task {
            
            guard let data = await Network.call(from: "https://desafio-mobile-pitang.herokuapp.com/movies/detail/\(movie?._id ?? "")") else {return}
            
            self.movieDescriptionLabel.text = Network.decode(MovieDetails.self, from: data)?.description
        }
    }
}
