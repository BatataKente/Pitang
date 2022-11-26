//
//  CollectionView.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 05/09/1401 AP.
//

import UIKit

class View_4: UIView, Setup {
    private let images = [UIImage(named: "0"), UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10"), UIImage(named: "11"), UIImage(named: "12"), UIImage(named: "13")]
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
    init(height: CGFloat = 300) {
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

extension View_4: UICollectionViewDelegate,
                  UICollectionViewDataSource,
                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collection.cellIdentifier,
                                                      for: indexPath)
        let imageView = Create.imageView(images[indexPath.row])
        let label = Create.button("\(indexPath.row)") {_ in
            print(indexPath.row)
        }
        cell.contentView.backgroundColor = .systemPink
        cell.contentView.addSubviews([imageView, label])
        imageView
            .constraint(attributesConstants: [.top: 20, .leading: 0, .trailing: 0])
            .constraint(attribute: .height, multiplier: 0.5)
        label
            .constraint(attributes: [.trailing, .leading, .bottom])
            .constraint(attribute: .height, multiplier: 0.5)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height,
                      height: collectionView.frame.height)
    }
}
