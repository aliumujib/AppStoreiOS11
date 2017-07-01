//
//  FeaturedAppCellBottomApp.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class FeaturedAppCellBottomApp: FeaturedAppCellWithBigAppIcon {
    
    var whiteBG : UIView = {
        let whiteBG = UIView()
        whiteBG.layer.cornerRadius = 12
        whiteBG.backgroundColor = UIColor.white
        return whiteBG
    }()
    
    var whiteBGCornerErase : UIView = {
        let whiteBG = UIView()
        whiteBG.backgroundColor = UIColor.white
        return whiteBG
    }()
    
    override func bindData(todayArticle: TodayArticle) {
        super.bindData(todayArticle: todayArticle)
        
    }

    
    //Very bad solution .. top replace with a mask whenever I figure that out
    
    override func setupViews() {
        super.setupViews()
        
        smallTitle.isHidden = false
    
        bigTitle.removeFromSuperview()
        appImage.removeFromSuperview()
        appDetails.removeFromSuperview()
        getBtn.removeFromSuperview()
        
        imageBg.addSubview(whiteBGCornerErase)
        imageBg.addSubview(whiteBG)
        
        whiteBG.addSubview(bigTitle)
        whiteBG.addSubview(appImage)
        whiteBG.addSubview(appDetails)
        whiteBG.addSubview(getBtn)
        
        whiteBG.anchor(nil, left: imageBg.leftAnchor, bottom: imageBg.bottomAnchor, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 60)
        
        whiteBGCornerErase.anchor(whiteBG.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        appImage.anchor(whiteBG.topAnchor, left: whiteBG.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        
        bigTitle.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 120, widthConstant: 0, heightConstant: 0)
        
        appDetails.anchor(appImage.topAnchor, left: appImage.rightAnchor, bottom: nil, right: getBtn.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        
        getBtn.anchor(appDetails.topAnchor, left: nil, bottom: nil, right: whiteBG.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 50, heightConstant: 0)
        
        imageBg.contentMode = .scaleAspectFill
        imageBg.layer.cornerRadius = 20
        imageBg.clipsToBounds = true
        
        bigTitle.textColor = .white
        smallTitle.textColor = .white
    }
    
    
}
