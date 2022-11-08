//
//  MoviewDetails.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class Details: UIViewController {
    
    private let movieTitleLabel = Create.label("Titulo", color: .white,
                                               font: Assets.font(30),
                                               alignment: .center)
    
    private let movieImageView = Create.imageView()
    
    private let movieDescriptionLabel = Create.label("aaaaaaaaaaa", font: Assets.font(15))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "\(type(of: self))"
        
        view.backgroundColor = .red
        view.addSubviews([movieTitleLabel, movieImageView, movieDescriptionLabel])
        
        movieTitleLabel.constraint(attributes_constants: [.top: 10, .leading: 0, .trailing: 0], to: view.safeAreaLayoutGuide)
        
        movieImageView.backgroundColor = .blue
        movieImageView.constraint(attributes_attributes: [.top: .bottom], to: movieTitleLabel, by: view.frame.height*0.05)
        movieImageView.constraint([.centerX])
        movieImageView.shape(size: view.frame.width*0.7)
        
        movieDescriptionLabel.constraint(attributes_attributes: [.top: .bottom], to: movieImageView, by: view.frame.height*0.05)
        movieDescriptionLabel.constraint(attributes_constants: [.leading: 40, .trailing: -40], to: view.safeAreaLayoutGuide)
    }
}
