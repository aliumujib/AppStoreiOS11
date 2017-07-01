//
//  TodayArticle.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation

struct TodayArticle {
    var app: App?
    var smallTitle: String?
    var bigTitle: String?
    var briefDescription: String?
    var article: String?
    var photo: String?
    var hasApp: Bool?
    var withBottomApp: Bool?

    
    init(app: App?, smallTitle: String, bigTitle: String, briefDescription: String, article: String?, photo: String, hasApp: Bool, withBottomApp: Bool) {
        
        self.app = app
        self.smallTitle = smallTitle
        self.bigTitle = bigTitle
        self.briefDescription = briefDescription
        self.article = article
        self.photo = photo
        self.hasApp = hasApp
        self.withBottomApp = withBottomApp
    }
    
    
    
    
}
