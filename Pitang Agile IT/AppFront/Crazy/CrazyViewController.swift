//
//  CrazyView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 18/08/1401 AP.
//

import UIKit

class CrazyViewController: UIViewController {
    
    private var urls: [String?] = []
    
    private let collection: (view: UICollectionView, cellReuseIdentifier: String) = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let identifier = "Cell"
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        return (view: collectionView, cellReuseIdentifier: identifier)
    }()
    
    private let text: (field: UITextField, stack: UIStackView) = {
        
        let textField = Create.textField()
        
        let stackView = UIStackView(arrangedSubviews: [textField])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20,
                                               bottom: 0, right: 20)
        
        return (field: textField, stack: stackView)
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "\(type(of: self))"
        
        text.field.addTarget(self, action: #selector(search), for: .editingChanged)
        let stack = UIStackView(arrangedSubviews: [collection.view, text.stack])
        
        view.backgroundColor = .systemMint
        view.addSubview(stack)
        
        collection.view.delegate = self
        collection.view.dataSource = self
        
        stack.axis = .vertical
        stack.constraint([.top,.leading,.trailing,.bottom], to: view.safeAreaLayoutGuide)
        
        Task {[weak self] in
            
            guard let data = await Network.call(from: "https://www.pexels.com/") else {return}
            
            print("$$$ \(data)")
            
            guard let texts = String(data: data, encoding: .ascii)?.split(separator: "\"") else {return}
            for text in texts {
                
                if text.contains("https") && text.contains("jpg") ||
                   text.contains("https") && text.contains("png") {
                    
                    self?.urls.append(String(text))
                }
            }
            self?.collection.view.reloadData()
        }
    }
    
    @objc func search(_ sender: UITextField) {
        
        Task {[weak self] in
            
            guard let data = await Network.call(from: "https://www.pexels.com/search/\(sender.text ?? "")") else {return}
            
            print("$$$ \(data)")
            
            guard let texts = String(data: data, encoding: .ascii)?.split(separator: "\"") else {return}
            for text in texts {
                
                if text.contains("https") && text.contains("jpg") ||
                   text.contains("https") && text.contains("png") {
                    
                    self?.urls.append(String(text))
                }
            }
            self?.collection.view.reloadData()
        }
    }
}

extension CrazyViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collection.cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        
        Task {
            
            guard let data = await Network.call(from: urls[indexPath.row] ?? "") else {return}
            
            let imageView = Create.imageView(UIImage(data: data))
            
            cell.contentView.addSubview(imageView)
            
            imageView.constraint([.top,.leading,.trailing,.bottom])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collection.view.frame.size
    }
}
