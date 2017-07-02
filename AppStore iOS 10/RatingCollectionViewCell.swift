//
//  RatingCollectionViewCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class RatingCollectionViewCell: UICollectionViewCell , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var reviews : [Review]? {
        didSet{
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
    
    
    var divider : UIView = {
        let divi = UIView()
        divi.backgroundColor = .lightGray
        return divi
    }()
    
    
    var titleLbl : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Ratings and Reviews"
        return label
    }()
    
    
    override func layoutSubviews() {
        addSubview(collectionView)
        addSubview(titleLbl)
        addSubview(divider)
        
        titleLbl.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 12, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        collectionView.anchor(titleLbl.bottomAnchor, left: leftAnchor, bottom: divider.topAnchor, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 14)
        
        divider.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        collectionView.register(RatingsViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = reviews?.count{
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
            return CGSize(width: collectionView.frame.width - 32, height: 200)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? RatingsViewCell{
            cell.rating = reviews?[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell() //Force a crash
    }
    
    
    
}
