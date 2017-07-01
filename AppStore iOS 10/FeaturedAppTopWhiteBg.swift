//
//  FeaturedAppTopWhiteBg.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class FeaturedAppTopWhiteBg: FeaturedAppCardCell {
    
    var whiteTransBG : UIView = {
        let whiteBG = UIView()
        //whiteBG.roundCorners([.topLeft, .bottomRight], radius: 20)
        whiteBG.layer.cornerRadius = 20
        whiteBG.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return whiteBG
    }()
    
    var whiteBGCornerErase : UIView = {
        let whiteBG = UIView()
        whiteBG.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        return whiteBG
    }()
    
    override func bindData(todayArticle: TodayArticle) {
        super.bindData(todayArticle: todayArticle)
    }
    
    
    override func layoutViews() {
        super.layoutViews()
        
        //imageBg.addSubview(whiteBGCornerErase)
        imageBg.addSubview(whiteTransBG)

        whiteTransBG.anchor(imageBg.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 100)
        
        //whiteBGCornerErase.anchor(nil, left: imageBg.leftAnchor, bottom: whiteTransBG.bottomAnchor, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        bigTitle.textColor = .white
        
        
    }
    
}
