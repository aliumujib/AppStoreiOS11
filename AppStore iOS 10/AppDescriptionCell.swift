//
//  AppDescriptionCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import ReadMoreTextView

class AppDescriptionCell: UICollectionViewCell {
    
    var appDesc : String? {
        didSet{
            if let appDesc = appDesc{
                readMoreTextView.attributedText = getAttributedDescText(text: (appDesc))
            }
        }
    }
    
    let readMoreTextView : ReadMoreTextView = {
        
        let readMore = ReadMoreTextView()
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
    
        let moreAttribString = NSMutableAttributedString(string: "more".uppercased(), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 9), NSForegroundColorAttributeName: headerBlue])
        
        let lessAttribString = NSMutableAttributedString(string: "less".uppercased(), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 9), NSForegroundColorAttributeName: headerBlue])

        readMore.attributedReadLessText = lessAttribString
        readMore.attributedReadMoreText = moreAttribString
        
        return readMore
    }()
    
    let developerTextView : UITextView = {
        
        let devTV = UITextView()
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)

        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        
        let developer = NSMutableAttributedString(string: "Developer\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 9), NSForegroundColorAttributeName: lightGray])
        
        developer.append(NSMutableAttributedString(string: "Aliu Abdul-Mujib", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: headerBlue]))
        
        devTV.attributedText = developer
        
        return devTV
    }()

    var divider : UIView = {
        let divi = UIView()
        divi.backgroundColor = .lightGray
        return divi
    }()
    
    func getAttributedDescText(text: String) -> NSMutableAttributedString {
        let atrributedString = NSMutableAttributedString()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        atrributedString.append(NSAttributedString(string: "\(text)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black]))
        let range = NSMakeRange(0, atrributedString.string.characters.count)
        atrributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        return atrributedString
    }
    
    var titleLbl : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "App Details"
        return label
    }()
    
    override func layoutSubviews() {
        addSubview(readMoreTextView)
        addSubview(developerTextView)
        addSubview(divider)
        addSubview(titleLbl)
        
        titleLbl.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 12, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        readMoreTextView.anchor(titleLbl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 400)
        
        developerTextView.anchor(readMoreTextView.bottomAnchor, left: readMoreTextView.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        divider.anchor(nil, left: readMoreTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}
