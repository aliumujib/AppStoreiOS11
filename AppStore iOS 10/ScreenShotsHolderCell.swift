//
//  ScreenShotsHolderCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class ScreenShotsHolderCell: UICollectionViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var screenShotURLS : [String]? {
        didSet{
            print("GOT HERE 4 ARRAY_SIZE \(String(describing: screenShotURLS?.count))")
            collectionView.reloadData()
        }
    }
    
    var collectionView : UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    override func layoutSubviews() {
        addSubview(collectionView)
        
        collectionView.fillSuperview()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ScreenShotViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = screenShotURLS?.count{
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
            return CGSize(width: collectionView.frame.width / 1.5, height: 300)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("GOT HERE 5")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ScreenShotViewCell{
            cell.imgURL = screenShotURLS?[indexPath.item]
            print("GOT HERE 6")
            return cell
        }
        
        return UICollectionViewCell() //Force a crash
    }
    
    
    
}
