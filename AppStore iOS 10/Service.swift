//
//  Service.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/2/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import Alamofire


class Service: NSObject {
    
    static var sharedInstance : Service = Service()
    
    override init() {
    }
    
    public func getAppSearch(searchTerm: String, completed: @escaping Completed) {
        var apps = [App]()
        let headers: HTTPHeaders = ["X-Apptweak-Key": API_KEY]
        Alamofire.request(getSearchURLForQuery(query: searchTerm), headers: headers).responseJSON { response in
            
            //print(response)
            
            if let result  = response.result.value as? Dictionary<String, Any>{
                
                if let mainDict = result["content"] as? [Dictionary<String, Any>]{
                    if !mainDict.isEmpty{
                        for article in mainDict{
                            var app = App()
                            app.appName = article["title"] as! String!
                            app.appDesc = article["developer"] as! String!
                            app.appPhoto = article["icon"] as! String!
                            app.appID = article["id"] as! Int!
                            app.appCategory = article["price"] as! String!
                            app.appRating = article["rating"] as! Double
                            apps.append(app)
                        }
                        
                    }
                }
            }
            
            completed(apps)
        }
    }
    
    public func getAppDetails(appID: Int, completed: @escaping (App?) -> ()) {
        var application: App?
        let headers: HTTPHeaders = ["X-Apptweak-Key": API_KEY]
        Alamofire.request(getDetailsURLForID(appID: appID), headers: headers).responseJSON { response in
            
            //print(response)
            
            if let result  = response.result.value as? Dictionary<String, Any>{
                
                if let allData = result["content"] as? Dictionary<String, Any>{
                    if let article = allData["store_info"] as? Dictionary<String, Any>{
                        var app = App()
                        app.appName = article["title"] as! String!
                        app.appDesc = article["description"] as! String!
                        app.appPhoto = article["icon"] as! String!
                        app.appCategory = article["price"] as! String!
                        
                        var screens = [String]()
                        if let screenShotsDict = article["screenshots"] as? Dictionary<String, Any>{
                            if let screenshotsfordevice = screenShotsDict["iphone6plus"] as? [Dictionary<String, Any>]{
                                for screenshot in screenshotsfordevice{
                                    let screen = screenshot["url"] as! String
                                    screens.append(screen)
                                }
                                app.screenShots = screens
                            }
                        }
                        application = app
                    }
    
                }
            }
            
            completed(application)
        }
    }
    
}
