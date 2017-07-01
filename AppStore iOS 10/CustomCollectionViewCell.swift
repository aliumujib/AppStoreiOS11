//
//  CustomCollectionViewCell.swift
//  CollectionViewCustom
//
//  Created by Damien Romito on 08/02/2017.
//
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 10)
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.clipsToBounds = true
        
        addSubview(titleLabel)
        
        titleLabel.fillSuperview()
    }

}



















































