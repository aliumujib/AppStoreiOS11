//
//  Utils.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit


func getAttributedStringForDesc(app : App) -> NSAttributedString {
    let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 2
    
    var attributedString = NSMutableAttributedString()
    
    if let appName = app.appName{
        attributedString = NSMutableAttributedString(string: "\(appName)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black])
    }
    
    if let appDesc = app.appDesc, let appCateg = app.appCategory{
        attributedString.append(NSAttributedString(string: "\(appDesc)\n\(appCateg)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))
    }
    
    return attributedString
}


func getAttributedStringForDescDetail(app : App) -> NSAttributedString {
    let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 2
    
    var attributedString = NSMutableAttributedString()
    
    if let appName = app.appName{
        attributedString = NSMutableAttributedString(string: "\(appName)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.black])
    }
    
    let range = NSMakeRange(0, attributedString.string.characters.count)
    attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
    
    if let appDesc = app.appDesc, let appCateg = app.appCategory{
        attributedString.append(NSAttributedString(string: "\(appDesc)\n\(appCateg)", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))
    }
    
    return attributedString
}
