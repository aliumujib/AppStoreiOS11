//
//  LargePhotoHorizontalCollectionViewCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class LargePhotoHorizontalCollectionViewCell: DatasourceCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
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
    
    var appData = [App]()
    
    var dummyData : [App]?{
        didSet{
            appData = NSArray(array: dummyData!, copyItems: true) as! [App]
            self.collectionView.reloadData()
        }
    }
    
    override func setupViews() {
        addSubview(collectionView)

        self.backgroundColor = .white
                
        collectionView.fillSuperview()
        collectionView.register(HorizontalBigAppCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? HorizontalBigAppCell{
            cell.app = appData[indexPath.item]
            return cell
        
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 32, height: 318)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appData.count
    }
    
    
}
