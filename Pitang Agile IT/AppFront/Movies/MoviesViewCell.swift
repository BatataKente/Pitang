//
//  MoviesViewCell.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesViewCell: UITableViewCell {
    
    let movieImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(movie: Movie?) {
        
        let label = Create.label(movie?.name)
        label.backgroundColor = .white
        
        let arrowImageView = Create.imageView(Assets.Images.right)
        arrowImageView.tintColor = .black
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        contentView.addSubviews([label, arrowImageView, line])
        
        Task {
            
            let data = await Network.call(from: movie?.url ?? "")
            
            if let data = data {
                
                movieImageView.image = UIImage(data: data)
                
                contentView.addSubview(movieImageView)
                
                movieImageView.constraint(attributes_constants: [.leading: 20, .top: 10, .bottom: -10])
                movieImageView.constraint(attributes_attributes: [.width: .height], to: movieImageView)
            }
        }
        
        label.constraint(attributes_constants: [.top: 0, .bottom: 0,
                                                .leading: contentView.frame.height*1.2,
                                                .trailing: -contentView.frame.height*1.2])
        
        arrowImageView.constraint(attributes_constants: [.centerY: 0, .trailing: -20])
        arrowImageView.shape(size: contentView.frame.height*0.3)
        
        line.constraint(attributes_constants: [.leading: 10, .trailing: -10, .bottom: 0])
        line.shape(height: 2)
    }
}
