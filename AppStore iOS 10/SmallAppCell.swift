//
//  SmallAppCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents
import Kingfisher


class SmallAppCell: DatasourceCell {
    

    var app: App? {
        didSet{
            smallTitle.text = app?.appStory
            appDetails.attributedText = getAttributedStringForDesc(app: app!)
            
            if let url = app?.appPhoto{
                let url = URL(string: url)
                imageBg.kf.setImage(with: url)
            }

        }
    }
    
    
    
    var smallTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text =  "New Games We Love"
        
        return label
    }()
    
    
    var seeAllText : UILabel = {
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = headerBlue
        label.text =  "See All"
        return label
    }()
    
    
    var inAppText : UILabel = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = lightGray
        label.numberOfLines = 0
        label.text =  "In-App \nPurchases"
        return label
    }()
    
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
    
    
    var appDetails : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()

    
    var imageBg : UIImageView = {
        let imgBG = UIImageView()
        imgBG.contentMode = .scaleToFill
        imgBG.layer.cornerRadius = 12
        imgBG.clipsToBounds = true
        return imgBG
    }()
    
    var divider : UIView = {
        let divi = UIView()
        divi.backgroundColor = .lightGray
        return divi
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layoutViews()
    }
    
    func layoutViews()  {
        addSubview(smallTitle)
        addSubview(seeAllText)
        addSubview(imageBg)
        addSubview(appDetails)
        addSubview(getBtn)
        addSubview(inAppText)
        addSubview(divider)
        
        smallTitle.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        seeAllText.isHidden = true
        seeAllText.anchor(smallTitle.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        imageBg.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 70, heightConstant: 70)
       
        appDetails.anchor(smallTitle.bottomAnchor, left: imageBg.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 6, leftConstant: 8, bottomConstant: 8, rightConstant: 60, widthConstant: 0, heightConstant: 50)
        
        getBtn.anchor(appDetails.bottomAnchor, left: appDetails.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        inAppText.anchor(getBtn.topAnchor, left: getBtn.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
                
    }

}

