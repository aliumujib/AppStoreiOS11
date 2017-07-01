//
//  FeaturedAppCellWithBigAppIcon.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class FeaturedAppCellWithBigAppIcon: FeaturedAppCardCell {
    
    
    override func bindData(todayArticle: TodayArticle) {
        super.bindData(todayArticle: todayArticle)
        
        if let app = todayArticle.app{
            appImage.image = UIImage(named: app.appPhoto!)
            appDetails.attributedText = getAtributedStringForDesc(app: app)
        }
        
    }
    
    func getAtributedStringForDesc(app: App) -> NSAttributedString {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attributedString = NSMutableAttributedString(string: "\(app.appName!)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black])
        
        attributedString.append(NSAttributedString(string: "\(app.appDesc!)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))
        
        let range = NSRange(location: 0, length: attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        return attributedString
    }
    
    
    var getBtn : UIButton = {
        let lightGray = UIColor(red: 240/255, green: 241/255, blue: 246/255, alpha: 1)
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        
        let backGroundImage = UIImage(color: lightGray, size: CGSize(width: 20, height: 10))
        
        let btn = UIButton()
        let attributedString = NSMutableAttributedString(string: "GET".uppercased(), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: headerBlue])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.setBackgroundImage(backGroundImage, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitle("GET".uppercased(), for: .normal)
        btn.setTitleColor(headerBlue, for: .normal)
        return btn
    }()
    
    
    var appDetails : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        
        label.numberOfLines = 0
        //label.attributedText = attributedString
        
        return label
    }()
    
    
    var appImage : UIImageView = {
        let imgBG = UIImageView()
        imgBG.contentMode = .scaleToFill
        imgBG.layer.cornerRadius = 12
        imgBG.clipsToBounds = true
        return imgBG
    }()
    
    

    override func layoutViews() {
        super.layoutViews()
        
        //effectively deactivates all contraints and anchors
        bigTitle.removeFromSuperview()
        
        imageBg.addSubview(appImage)
        imageBg.addSubview(appDetails)
        imageBg.addSubview(getBtn)
        imageBg.addSubview(bigTitle)
        
        smallTitle.isHidden = true
        smallDescription.isHidden = true
        
        appImage.anchor(imageBg.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        bigTitle.anchor(appImage.bottomAnchor, left: imageBg.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 150, widthConstant: 0, heightConstant: 0)
        bigTitle.numberOfLines = 0
        bigTitle.font = UIFont.systemFont(ofSize: 30)
        
        appDetails.anchor(nil, left: bigTitle.leftAnchor, bottom: imageBg.bottomAnchor, right: getBtn.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 8, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        
        getBtn.anchor(appDetails.topAnchor, left: nil, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 50, heightConstant: 0)
        
    }

    
    
    
}
