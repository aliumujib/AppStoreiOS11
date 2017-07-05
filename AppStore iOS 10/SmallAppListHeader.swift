//
//  SmallAppListHeader.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/5/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class SmallAppListHeader: UICollectionViewCell {
    
    var title : String? {
        didSet{
            bigTitle.text = title!
        }
    }
    
    var bigTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.text = "Today"
        return label
    }()
    
    override func layoutSubviews() {
        addSubview(bigTitle)
        
        self.backgroundColor = UIColor.white
    
        bigTitle.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        

    }
    
}
