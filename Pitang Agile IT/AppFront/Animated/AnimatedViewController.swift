//
//  AnimatedViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 28/08/1401 AP.
//

import UIKit

class AnimatedViewController: UIViewController {
    
    // setup UI
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let baseView = UIView()
    
    fileprivate func setupLabels() {
        titleLabel.numberOfLines = 0
        titleLabel.text = "Welcome to hell"
        titleLabel.font = UIFont.systemFont(ofSize: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hello there! Thanks so much for downlowding our brand new app and giving us a try. Make sure to leave us a good review in the AppStore."
    }
    
    fileprivate func setupStack() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        //        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        
        // enables autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                         constant: -100).isActive = true
    }
    
    fileprivate func setupView() {
        baseView.backgroundColor = .lightGray
        baseView.frame = CGRect(x: view.frame.minX,
                                y: view.frame.maxY,
                                width: view.frame.width, height: 0)
        view.addSubview(baseView)
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        baseView.frame = CGRect(x: view.frame.minX,
                                y: view.frame.maxY,
                                width: view.frame.width,
                                height: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupLabels()
        setupStack()
        setupView()
        
        // fun animations
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(tapMe)))
    }
    
    @objc func tapMe() {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut) {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: {_ in
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut) {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            }
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut) {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        } completion: {_ in
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut) {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            }
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseOut) {
            
            self.baseView.frame = CGRect(x: self.view.frame.minX,
                                         y: self.view.frame.maxY*0.8,
                                         width: self.view.frame.width,
                                         height: self.view.frame.height*0.2)
        }
    }
}
