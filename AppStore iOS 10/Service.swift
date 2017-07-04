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
        //print("PERFORMING SEARCH: \(searchTerm) at URL: \(getSearchURLForQuery(query: searchTerm))")
        var apps = [App]()
        let headers: HTTPHeaders = ["X-Apptweak-Key": API_KEY]
        Alamofire.request(getSearchURLForQuery(query: searchTerm), headers: headers).responseJSON { response in
            
            //print(response.result.value)
            
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
                var app = App()
                if let allData = result["content"] as? Dictionary<String, Any>{
                    if let article = allData["store_info"] as? Dictionary<String, Any>{
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
                        
                       
                        
                    }
                    
                    var reviews = [Review]()
                    if let reviewsDict = allData["reviews"] as? [Dictionary<String, Any>]{
                        print("I AM HERE")
                        for reviewJSON in reviewsDict{
                            var review = Review()
                            review.author = reviewJSON["author"] as! String
                            
                            //Skipped some reviews for pleasing aesthetics
                            if let title = reviewJSON["title"] as? String{
                                review.title = title
                            }else{
                                continue
                            }
                            
                            if let content = reviewJSON["content"] as? String{
                                if content.characters.count < 100 {
                                    continue
                                }
                                review.content = content
                            }else{
                                continue
                            }
                            //review.version = reviewJSON["version"] as! String
                            review.date = reviewJSON["date"] as! String
                            review.rating = reviewJSON["rating"] as! Double
                            reviews.append(review)
                        }
                        app.appReviews = reviews
                    }
                    application = app
                }
            }
            
            completed(application)
        }
    }
    
}
