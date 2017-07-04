//
//  SmallAppSearchUpdateCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/4/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class SmallAppSearchUpdateCell: SmallAppCell {
    
    override func awakeFromNib() {

    }
    
    override func setupViews() {
        super.setupViews()
        seeAllText.text = ""
        
        divider.isHidden = true
        divider.anchor(nil, left: imageBg.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        

    }
    
}
