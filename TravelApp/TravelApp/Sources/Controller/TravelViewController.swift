//
//  ViewController.swift
//  TravelApp
//
//  Created by Александр Косяков on 28.12.2022.
//

import UIKit

final class TravelViewController: UIViewController {
    
    // MARK: - Properties

    let selfView = TravelView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = selfView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selfView.collectionViewTop.delegate = self
        selfView.collectionViewTop.dataSource = self
        
        selfView.collectionViewMiddle.delegate = self
        selfView.collectionViewMiddle.dataSource = self
      
        selfView.collectionViewBottom.delegate = self
        selfView.collectionViewBottom.dataSource = self
    }
}

// MARK: - CollectionViewDataSource

extension TravelViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {

            case selfView.collectionViewTop :
                return dataTopCV.count
                
            case selfView.collectionViewMiddle :
                return dataMiddleCV.count

            default:
                return dataBottomCV.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
                
            case selfView.collectionViewTop :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTop", for: indexPath) as! CustomCellTop
                cell.data = dataTopCV[indexPath.item]
                return cell
                
            case selfView.collectionViewMiddle :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellMiddle", for: indexPath) as! CustomCellMiddle
                cell.data = dataMiddleCV[indexPath.item]
                return cell

            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellBottom", for: indexPath) as! CustomCellBottom
                cell.data = dataBottomCV[indexPath.item]
                return cell
        }
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension TravelViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch collectionView {

            case selfView.collectionViewTop :
                return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/3)

            case selfView.collectionViewMiddle :
                return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/2)

            default:
                return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/3)
        }
    }
}


import SwiftUI

struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 14 Pro ")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = TravelViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
