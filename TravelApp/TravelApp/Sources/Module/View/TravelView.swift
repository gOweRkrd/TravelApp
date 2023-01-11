//
//  View.swift
//  TravelApp
//
//  Created by Александр Косяков on 29.12.2022.
//

import UIKit

final class TravelView: UIView {
    
    // MARK: - View
    
    let collectionViewTop: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewTop = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewTop.backgroundColor = UIColor(red: 228 / 255, green: 196 / 255, blue: 172 / 255, alpha: 1)
        return collectionViewTop
    }()

    let collectionViewMiddle: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewMiddle = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewMiddle.backgroundColor = UIColor(red: 228 / 255, green: 196 / 255, blue: 172 / 255, alpha: 1)
        return collectionViewMiddle
    }()
    
    let collectionViewBottom: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewBottom = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewBottom.backgroundColor = UIColor(red: 228 / 255, green: 196 / 255, blue: 172 / 255, alpha: 1)
        return collectionViewBottom
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print(frame.width, frame.height)
        configure()
        addSubView()
        setupConstraints()
        
        collectionViewTop.register(CustomCellTop.self, forCellWithReuseIdentifier: "cellTop")
        collectionViewTop.register(CustomCellFirstTop.self, forCellWithReuseIdentifier: "cellTop2")
        collectionViewMiddle.register(CustomCellMiddle.self, forCellWithReuseIdentifier: "cellMiddle")
        collectionViewBottom.register(CustomCellBottom.self, forCellWithReuseIdentifier: "cellBottom")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

private extension TravelView {
    
    func configure() {
        backgroundColor = UIColor(red: 228 / 255, green: 196 / 255, blue: 172 / 255, alpha: 1)
    }
    
    func addSubView() {
        addSubview(collectionViewTop)
        addSubview(collectionViewMiddle)
        addSubview(collectionViewBottom)
        
        collectionViewTop.translatesAutoresizingMaskIntoConstraints = false
        collectionViewMiddle.translatesAutoresizingMaskIntoConstraints = false
        collectionViewBottom.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            collectionViewTop.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            collectionViewTop.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionViewTop.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionViewTop.heightAnchor.constraint(equalToConstant: 170),

            collectionViewMiddle.topAnchor.constraint(equalTo: collectionViewTop.bottomAnchor),
            collectionViewMiddle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionViewMiddle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionViewMiddle.heightAnchor.constraint(equalToConstant: 390),

            collectionViewBottom.topAnchor.constraint(equalTo: collectionViewMiddle.bottomAnchor, constant: 18),
            collectionViewBottom.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            collectionViewBottom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionViewBottom.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
