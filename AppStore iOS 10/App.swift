//
//  App.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import Foundation


struct App {
    var appName: String?
    var appDesc: String?
    var appID: Int?
    var appCategory: String?
    var appPrice: Int?
    var appStory: String?
    var appPhoto: String?
    var screenShots: [String]?
    var appRating: Double?
    var appReviews: [Review]?
    
    init() {
        
    }
    
    init(appName: String, appDesc: String, appID: Int, appCategory: String, appPrice: Int, appStory: String, appPhoto: String, screenShots: [String]) {
        self.appName = appName
        self.appDesc = appDesc
        self.appID = appID
        self.appCategory = appCategory
        self.appPrice = appPrice
        self.appStory = appStory
        self.appPhoto = appPhoto
        self.screenShots = screenShots
    }
    
    
    
}
