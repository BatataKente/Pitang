//
//  MoviewDetails.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    private let player = Player()
    private var result: Result?
    private let movieTitleLabel: UILabel
    private var movieImageView = UIImageView()
    init(_ result: Result?) {
        self.result = result
        self.movieTitleLabel = Create.label(result?.title, color: .white,
                                            font: Assets.font(30),
                                            alignment: .center)
        self.movieDescriptionLabel.text = result?.overview
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let movieDescriptionLabel = Create.label(color: .white,
                                                     font: Assets.font(15))
    override func viewDidLoad() {
        super.viewDidLoad()
        let playButton = Create.button("play") {_ in
            self.player.play("https://player.odycdn.com/api/v4/streams/free/Berserk13/51911083d759ab4a8b20bd6813400b6df14cabd7/ff1053",
                             videoContent: self.view)
        }
        title = "\(type(of: self))"
        view.backgroundColor = .systemIndigo
        view.addSubviews([movieImageView, movieTitleLabel, movieDescriptionLabel, playButton])
        movieImageView.constraint([.top,.leading,.trailing])
        movieImageView.shape(height: view.frame.height*0.3)
        movieTitleLabel.constraint(attributesAttributes: [.top: .bottom], to: movieImageView, by: 20)
        movieTitleLabel.constraint(attributesConstants: [.leading: 0, .trailing: 0],
                                   to: view.safeAreaLayoutGuide)
        movieDescriptionLabel.constraint(attributesAttributes: [.top: .bottom], to: movieTitleLabel,
                                         by: view.frame.height*0.05)
        movieDescriptionLabel.constraint(attributesConstants: [.leading: 40, .trailing: -40],
                                         to: view.safeAreaLayoutGuide)
        playButton.constraint([.centerX, .bottom], to: view.safeAreaLayoutGuide)
        Task {
            
            guard let data = await Network.call(from: "https://image.tmdb.org/t/p/original\(result?.backdrop_path ?? "")") else {return}
        
            self.movieImageView.image = UIImage(data: data)
        }
    }
}
