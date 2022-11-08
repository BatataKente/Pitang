//
//  MoviesViewModel.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesViewModel {
    
    func setup(cell: UITableViewCell, movie: Movie?) {
        
        let label = Create.label(movie?.name)
        label.backgroundColor = .white
        
        let arrowImageView = Create.imageView(Assets.Images.right)
        arrowImageView.tintColor = .black
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        cell.contentView.addSubviews([label, arrowImageView, line])
        
        Task {
            
            let data = await Network.call(from: movie?.url ?? "")
            
            if let data = data {
                
                let movieImageView = await UIImageView(image: UIImage(data: data))
                
                await cell.contentView.addSubview(movieImageView)
                
                await movieImageView.constraint(attributes_constants: [.leading: 20, .top: 10, .bottom: -10])
                await movieImageView.constraint(attributes_attributes: [.width: .height], to: movieImageView)
            }
        }
        
        label.constraint(attributes_constants: [.top: 0, .bottom: 0,
                                                .leading: cell.contentView.frame.height*1.2,
                                                .trailing: -cell.contentView.frame.height*1.2])
        
        arrowImageView.constraint(attributes_constants: [.centerY: 0, .trailing: -20])
        arrowImageView.shape(size: cell.frame.height*0.3)
        
        line.constraint(attributes_constants: [.leading: 10, .trailing: -10, .bottom: 0])
        line.shape(height: 2)
    }
}
