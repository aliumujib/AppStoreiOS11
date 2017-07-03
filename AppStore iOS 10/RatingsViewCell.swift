//
//  RatingsViewCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import Cosmos

class RatingsViewCell: UICollectionViewCell {
    
    var rating : Review? {
        didSet{
            if let rating = rating{
                titleLbl.text = (rating.title)!
                ratingBar.rating = (rating.rating)!
                reviewContent.attributedText = getAttributedStringForReview(review: rating)
            }
        }
    }
    
    var ratingBar: CosmosView = {
        let rb = CosmosView()
        rb.rating = 4
        rb.settings.starSize = 15
        rb.settings.fillMode = .precise
        rb.settings.filledColor = UIColor.orange
        rb.settings.emptyBorderColor = UIColor.orange
        rb.settings.filledBorderColor = .white
        return rb
    }()

    var titleLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func getAttributedStringForReview(review : Review) -> NSAttributedString {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1
        
        let attributedString = NSMutableAttributedString(string: "\(review.author!)\n\(review.date!)\n\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 9), NSForegroundColorAttributeName: lightGray])
        
        
        attributedString.append(NSAttributedString(string: "\(review.content!)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black]))
        
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        return attributedString
    }
    
    var reviewContent : UITextView = {
        let label = UITextView()
        label.backgroundColor = .clear
        label.isScrollEnabled = false
        label.contentMode = UIViewContentMode.top
        // label.attributedText = attributedString
        return label
    }()
    
    
    var reviewBg : UIView = {
        let lightGray = UIColor(red: 230/255, green: 229/255, blue: 235/255, alpha: 1)
        let reviewBg = UIView()
        reviewBg.backgroundColor = lightGray
        reviewBg.layer.cornerRadius = 5
        return reviewBg
    }()

    override func layoutSubviews() {
        addSubview(reviewBg)
        
        reviewBg.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 16, rightConstant: 4, widthConstant: 0, heightConstant: 0)
        
        reviewBg.addSubview(reviewContent)
        reviewBg.addSubview(titleLbl)
        reviewBg.addSubview(ratingBar)
        
        titleLbl.anchor(reviewBg.topAnchor, left: reviewBg.leftAnchor, bottom: nil, right: reviewBg.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        ratingBar.anchor(titleLbl.bottomAnchor, left: titleLbl.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        reviewContent.anchor(ratingBar.bottomAnchor, left: titleLbl.leftAnchor, bottom: self.bottomAnchor, right: titleLbl.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 32, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
