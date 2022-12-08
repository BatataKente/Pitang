//
//  View_3.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

class View_3: UIView, Setup {
    private var texts: [NSAttributedString] = []
    private lazy var collection: (view: UICollectionView, cellIdentifier: String) = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        let identifier = "Cell"
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: identifier)
        return (view: collectionView, cellIdentifier: identifier)
    }()
    init(height: CGFloat = 75,_ texts: [String] = []) {
        super.init(frame: .zero)
        setup()
        heightAnchor.constraint(equalToConstant: height).isActive = true
        setupCollection(texts)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configute() {
        addSubview(collection.view)
    }
    func constrain() {
        collection.view.constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
    private func setupCollection(_ texts: [String]) {
        let createColor = {(color: UIColor) -> [NSAttributedString.Key : UIColor]? in
            return [NSAttributedString.Key.foregroundColor : color]
        }
        let power: NSMutableAttributedString = NSMutableAttributedString()
        power.append(NSAttributedString(string: "P",
                                        attributes: createColor(.blue)))
        power.append(NSAttributedString(string: "O",
                                        attributes: createColor(.red)))
        power.append(NSAttributedString(string: "W",
                                        attributes: createColor(.black)))
        power.append(NSAttributedString(string: "E",
                                        attributes: createColor(.yellow)))
        power.append(NSAttributedString(string: "R",
                                        attributes: createColor(.green)))
        self.texts.append(power)
        for text in texts {
            self.texts.append(NSAttributedString(string: text))
        }
    }
}

extension View_3: UICollectionViewDelegate,
                  UICollectionViewDataSource,
                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return texts.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collection.cellIdentifier,
                                                      for: indexPath)
        let label = Create.label(attributedText: texts[indexPath.row])
        label.textAlignment = .center
        cell.contentView.addSubview(label)
        label.constraint(attributes: [.top, .leading, .trailing, .bottom])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.5,
                      height: collectionView.frame.height)
    }
}
