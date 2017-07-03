//
//  GeneralHeaderCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import LBTAComponents

class GeneralHeaderCell: DatasourceCell {

    var headerItem : HeaderItem? {
    
        didSet{
            smallTitle.text = headerItem?.smalltitle
            bigTitle.text = headerItem?.bigTitle
                if let hide = headerItem?.hideDivider{
                    divider.isHidden = hide
                }
            //backgroundColor = .red
        }
    
    }
    
    
    
    
    var smallTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        //label.text = "Monday, June 5".uppercased()
        //label.textColor = UIColor(white: 1, alpha: 0.4)
        return label
    }()
    
    var bigTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.text = "Today"
        return label
    }()
    
    var avaImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "alium")
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        return img
    }()
    
    var divider : UIView = {
        let divi = UIView()
        divi.backgroundColor = .lightGray
        return divi
    }()
    
    
    override func setupViews() {
        super.setupViews()
        //self.backgroundColor = .gray
        
        layoutViews()

    }
    
    func hideDivider() {
        divider.isHidden = true
    }
    
    func hideSmallTitle() {
        smallTitle.isHidden = true
    }

    
    func layoutViews() {
        addSubview(smallTitle)
        addSubview(bigTitle)
        addSubview(avaImg)
        addSubview(divider)
        
        self.backgroundColor = UIColor.white//.withAlphaComponent(0.9)

        smallTitle.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 36, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        bigTitle.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        avaImg.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 16, widthConstant: 41, heightConstant: 41)
        
        divider.anchor(nil, left: bigTitle.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
    }

}
