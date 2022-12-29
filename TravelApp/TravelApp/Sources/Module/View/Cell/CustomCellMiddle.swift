//
//  CustomCellVertical.swift
//  TravelApp
//
//  Created by Александр Косяков on 28.12.2022.
//

import UIKit

final class CustomCellMiddle: UICollectionViewCell {
    
    var data: CustomDataMiddle? {
        didSet {
            guard let data = data else { return }
            imageView.image = data.image
            labelCountry.text = data.title
        }
    }
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    lazy var labelCountry : UILabel = {
        
        let labelCountry = UILabel()
        labelCountry.font = UIFont.boldSystemFont(ofSize: 30.0)
        labelCountry.textAlignment = .center
        labelCountry.textColor = UIColor(red: 248/255, green: 247/255, blue: 241/255, alpha: 1)
       
        return labelCountry
    } ()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubView ()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains

private extension CustomCellMiddle {
    
    func addSubView() {
        contentView.addSubview(imageView)
        contentView.addSubview(labelCountry)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelCountry.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            labelCountry.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -120),
            labelCountry.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            labelCountry.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            labelCountry.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}

