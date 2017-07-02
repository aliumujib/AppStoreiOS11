//
//  DividerFooter.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class DividerFooter: DatasourceCell {
    
    var smallSectionDivider : Bool? {
        didSet{
            if(smallSectionDivider!){
                divider.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 104, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
            }else{
                divider.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
            }
        }
    }

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
        addSubview(divider)
        
        
    }
}
