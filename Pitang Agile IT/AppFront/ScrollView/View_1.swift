//
//  CollectionView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

class View_1: UIView, Setup {
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
    init(height: CGFloat = 50) {
        super.init(frame: .zero)
        setup()
        self.height(constant: height)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubview(collection.view)
    }
    func setupConstraints() {
        collection.view.constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
}

extension View_1: UICollectionViewDelegate,
                  UICollectionViewDataSource,
                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collection.cellIdentifier,
                                                      for: indexPath)
        let label = Create.label("\(indexPath.row)", color: .white)
        label.textAlignment = .center
        label.backgroundColor = .systemPink
        cell.contentView.addSubview(label)
        label.constraint(attributes: [.top, .leading, .trailing, .bottom])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height,
                      height: collectionView.frame.height)
    }
}
