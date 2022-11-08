//
//  Create.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import UIKit

struct Create {
    
    static func navigationController(rootViewController: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        let standardAppearance = UINavigationBarAppearance()

        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear

        navigationController.navigationBar.standardAppearance = standardAppearance
        navigationController.navigationBar.scrollEdgeAppearance = standardAppearance
        
        return navigationController
    }
    
    static func textField(_ text: String? = nil,
                          placeholder: String? = nil,
                          font: UIFont? = UIFont.systemFont(ofSize: 20, weight: .bold),
                          textColor: UIColor? = .black,
                          alignment: NSTextAlignment = .left,
                          background: UIColor? = .white) -> UITextField {
        
        let textField = UITextField()
        textField.text = text
        textField.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                             attributes: [NSAttributedString.Key.font: font ?? UIFont()])
        textField.font = font
        textField.textColor = textColor
        textField.textAlignment = alignment
        textField.layer.cornerRadius = 10
        textField.backgroundColor = background
        
        return textField
    }
    
    static func stack(_ spacing: CGFloat = 20,
                      arrangedSubviews: [UIView] = [],
                      axis: NSLayoutConstraint.Axis = .vertical) -> UIStackView {
        
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = .center
        
        return stack
    }
    
    static func imageView(_ image: UIImage? = nil,
                          color: UIColor? = nil,
                          alpha: CGFloat = 1) -> UIImageView {
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.tintColor = color
        imageView.layer.masksToBounds = true
        imageView.alpha = alpha
        
        return imageView
    }
    
    static func label(_ text: String? = nil,
                      color: UIColor = .black,
                      font: UIFont? = UIFont.systemFont(ofSize: 20, weight: .bold),
                      alignment: NSTextAlignment = .left,
                      alpha: CGFloat = 1) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.alpha = alpha
        
        return label
    }
    
    static func button(_ title: String? = nil,
                       font: UIFont? = UIFont.systemFont(ofSize: 20, weight: .bold),
                       image: UIImage? = nil,
                       handler: @escaping UIActionHandler) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.addAction(UIAction(handler: handler), for: .touchUpInside)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.font = font
        
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.constraint([.height], to: button.titleLabel,
                                     multiplier: 0.9)
        button.imageView?.constraint(attributes_attributes: [.width: .height], to: button.imageView,
                                     multiplier: 0.7)
        
        return button
    }
}
