//
//  MoviesViewCell.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    let movieImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(result: Result?) {
        
        let label = Create.label(result?.title)
        label.backgroundColor = .white
        
        let arrowImageView = Create.imageView(Assets.Images.right)
        arrowImageView.tintColor = .black
        
        let line = UIView()
        line.backgroundColor = .lightGray
        
        contentView.addSubviews([label, arrowImageView, line])
        
        Task {
            
            let data = await Network.call(from: "https://image.tmdb.org/t/p/original\(result?.poster_path ?? "")")
            
            if let data = data {
                
                movieImageView.image = UIImage(data: data)
                
                contentView.addSubview(movieImageView)
                
                movieImageView
                    .constraint(attributesConstants: [.leading: 20, .top: 10, .bottom: -10])
                    .constraint(attributesAttributes: [.width: .height], to: movieImageView)
            }
        }
        
        label.constraint(attributesConstants: [.top: 0, .bottom: 0,
                                               .leading: contentView.frame.height*1.2,
                                               .trailing: -contentView.frame.height*1.2])
        
        arrowImageView
            .constraint(attributesConstants: [.centerY: 0, .trailing: -20])
            .shape(constant: contentView.frame.height*0.3)
        
        line
            .constraint(attributesConstants: [.leading: 10, .trailing: -10, .bottom: 0])
            .height(constant: 2)
    }
}
