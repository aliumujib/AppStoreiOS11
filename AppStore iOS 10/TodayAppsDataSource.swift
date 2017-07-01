//
//  TodayAppsDataSource.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents


class TodayAppsDataSource: Datasource {
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [GeneralHeaderCell.self]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [  FeaturedAppCardCell.self, FeaturedAppTopWhiteBg.self, FeaturedAppCellWithBigAppIcon.self,FeaturedAppCellBottomApp.self,]
    }
    
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return TodayAppsDataSource.dummyData.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return TodayAppsDataSource.dummyData[indexPath.row]
    }
    
    
    static var dummyData : [TodayArticle] = {
        let app1 = App(appName: "Geometrics", appDesc: "Explore Architecture around you", appID: 1, appCategory: "Leisure", appPrice: 0, appStory:"123", appPhoto: "geometrics", screenShots: [""])
        
        let app2 = App(appName: "Polaroids", appDesc: "Edit and Share your photos", appID: 1, appCategory: "Social Networking", appPrice: 0, appStory:"123", appPhoto: "camera_app", screenShots: [""])
        
        let todayArticle1 = TodayArticle(app: nil, smallTitle: "EXPLORE", bigTitle: "The Beauty of modern Living", briefDescription: "Pimp up your home with latest design classics and smart helpers.", article: "123", photo: "good_living", hasApp: false, withBottomApp: false)
        
        let todayArticle4 = TodayArticle(app: nil, smallTitle: "GET STARTED", bigTitle: "Books and Plan your holidays right", briefDescription: "", article: "123", photo: "air_plane", hasApp: false, withBottomApp: false)
        
        let todayArticle2 = TodayArticle(app: app1, smallTitle: "", bigTitle: "App of The Day".uppercased(), briefDescription: "", article: "123", photo: "architexture", hasApp: true, withBottomApp: false)
        
        let todayArticle3 = TodayArticle(app: app2, smallTitle: "HOW TO", bigTitle: "5 tips to Take The perfect Shot", briefDescription: "", article: "123", photo: "cam_holder", hasApp: true, withBottomApp: true)
        
        return [todayArticle2, todayArticle3, todayArticle1, todayArticle4]
    
    }()
    
    
}
