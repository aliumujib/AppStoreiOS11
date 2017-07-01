//
//  HorizontalBigAppCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class HorizontalBigAppCell: DatasourceCell {
    
    var app: App? {
        didSet{
            smallTitle.attributedText = getAttributedStringForHeading(app: app!)
            imageBg.image = UIImage(named: (app?.appPhoto)!)
            imageBg.clipsToBounds = true
            imageBg.layer.cornerRadius = 12
        }
    }
    
    
    
    func getAttributedStringForHeading(app : App) -> NSAttributedString {
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        
        let attributedString = NSMutableAttributedString(string: "\(app.appCategory!)\n".uppercased(), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 9), NSForegroundColorAttributeName: headerBlue])
        
        attributedString.append(NSAttributedString(string: "\(app.appName!)\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName: UIColor.black]))
        
        attributedString.append(NSAttributedString(string: "\(app.appDesc!)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20), NSForegroundColorAttributeName: lightGray]))
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)

        return attributedString
    }

    var smallTitle : UITextView = {
        let label = UITextView()
       // label.attributedText = attributedString
        return label
    }()
    
    
    var imageBg : UIImageView = {
        let imgBG = UIImageView()
        imgBG.contentMode = .scaleAspectFill
        imgBG.clipsToBounds = true
        imgBG.layer.cornerRadius = 12
        imgBG.layer.masksToBounds = true
        imgBG.backgroundColor = .blue
        return imgBG
    }()
    
   
    
    override func setupViews() {
        super.setupViews()
    
        
        layoutViews()
    }
    
    func layoutViews()  {
        addSubview(imageBg)
        addSubview(smallTitle)
        
        smallTitle.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        imageBg.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
}
