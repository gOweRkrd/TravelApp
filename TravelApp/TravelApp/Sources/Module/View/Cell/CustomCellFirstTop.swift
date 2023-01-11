//
//  CustomCellSecondCell.swift
//  TravelApp
//
//  Created by Александр Косяков on 29.12.2022.
//

import UIKit

final class CustomCellFirstTop: UICollectionViewCell {
    
    var data: CustomDataTop? {
        didSet {
            guard let data = data else { return }
            imageView.image = data.image
            imageViewSecond.image = data.image
        }
    }

    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "plus")
        return imageView
    }()
    
    private let imageViewSecond: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "barcode")
        return imageView
    }()
    
    private let imageStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains

private extension CustomCellFirstTop {
    
    func addSubView() {
        
        contentView.addSubview(imageStack)
        imageStack.addArrangedSubview(imageView)
        imageStack.addArrangedSubview(imageViewSecond)
        
        imageStack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewSecond.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

            imageView.widthAnchor.constraint(equalToConstant: 55),
            imageView.heightAnchor.constraint(equalToConstant: 55),
            
            imageViewSecond.widthAnchor.constraint(equalToConstant: 55),
            imageViewSecond.heightAnchor.constraint(equalToConstant: 55),
            
            imageStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
