//
//  Extension.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}

extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension UIViewController{
    
    func statusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }
    
    func hideNavBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNavBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setUpNavBar()  {
        if let navBar = self.navigationController?.navigationBar{
            navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navBar.shadowImage = UIImage()
            navBar.isTranslucent = false
            navBar.backgroundColor = .white
        }
    }
    
    func resetNavBar()  {
        if let navBar = self.navigationController?.navigationBar{
            navBar.setBackgroundImage(nil, for: UIBarMetrics.default)
            navBar.shadowImage = nil
            navBar.isTranslucent = false
            navBar.backgroundColor = .white
        }
    }
    
}


extension UIView {
    
    func materialize()  {
        
        let cornerRadius: CGFloat = 3
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 3
        let shadowColor: UIColor? = UIColor.black
        let shadowOpacity: Float = 0.5
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            mask.backgroundColor = UIColor.white.cgColor
            self.layer.mask = mask
            //backgroundColor = UIColor.white.withAlphaComponent(0.7)
    }
    
    func clearConstraints(){
        for subview in self.subviews{
            subview.clearConstraints()
        }
        
        self.removeConstraints(self.constraints)
    }

    
}

