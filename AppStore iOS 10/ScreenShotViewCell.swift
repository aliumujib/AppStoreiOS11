//
//  ScreenShotViewCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class ScreenShotViewCell: UICollectionViewCell {
    
    var imgURL : String? {
        didSet{
            let url = URL(string: imgURL!)
            screenShot.kf.setImage(with: url)
        }
    }
    
    var screenShot : UIImageView = {
        let imgBG = UIImageView()
        imgBG.image = #imageLiteral(resourceName: "good_living")
        imgBG.contentMode = .scaleAspectFill
        imgBG.layer.cornerRadius = 7
        imgBG.clipsToBounds = true
        return imgBG
    }()
    
    override func layoutSubviews() {
        addSubview(screenShot)
        
        screenShot.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        
        
        
    }
    
}
