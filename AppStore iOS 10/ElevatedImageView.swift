//
//  ElevatedImageView.swift
//  FancyNewsReader
//
//  Created by Abdul-Mujib Aliu on 6/19/17.
//  Copyright © 2017 Abdul-Mujib Aliu. All rights reserved.
//

import UIKit

@IBDesignable
class ElevatedImageView: UIImageView {
    
     var cornerRadius: CGFloat = 6
     var shadowOffsetWidth: Int = 0
     var shadowOffsetHeight: Int = 1
     var shadowColor: UIColor? = UIColor.black
     var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
