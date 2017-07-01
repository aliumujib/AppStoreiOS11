//
//  HeaderItem.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation


struct HeaderItem {
   var smalltitle: String?
    var bigTitle: String?
    var hideDivider : Bool?
    
    init(smallTitle: String, bigTitle: String, hideDiv: Bool) {
        self.smalltitle  = smallTitle
        self.bigTitle = bigTitle
        self.hideDivider = hideDiv
    }
}
