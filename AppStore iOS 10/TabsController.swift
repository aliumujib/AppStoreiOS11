//
//  ViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class TabsController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = TodaysAppsController()
        let tabOneBarItem = UITabBarItem(title: "Today", image: UIImage(named: "today"), selectedImage: UIImage(named: "today")?.maskWithColor(color: .blue))
        
        // Create Tab two
        let tabTwo = GamesAppsController()
        let tabTwoBarItem = UITabBarItem(title: "Games", image: UIImage(named: "games"), selectedImage: UIImage(named: "games")?.maskWithColor(color: .blue))
        
        // Create Tab three
        let tabThree = GamesAppsController()
        let tabThreeBarItem = UITabBarItem(title: "Apps", image: UIImage(named: "apps"), selectedImage: UIImage(named: "apps")?.maskWithColor(color: .blue))
        
        // Create Tab 4
        let tabFour = UpdatesViewController()
        let tabFourBarItem = UITabBarItem(title: "Updates", image: UIImage(named: "updates"), selectedImage: UIImage(named: "updates")?.maskWithColor(color: .blue))
        
        // Create Tab 5
        let tabFive = SearchViewController()
        let tabFiveBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "search")?.maskWithColor(color: .blue))
        
        tabOne.tabBarItem = tabOneBarItem
        tabTwo.tabBarItem = tabTwoBarItem
        tabThree.tabBarItem = tabThreeBarItem
        tabFour.tabBarItem = tabFourBarItem
        tabFive.tabBarItem = tabFiveBarItem
        
        self.automaticallyAdjustsScrollViewInsets = false

        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
        
        hideNavBar()
        
        let items = ["angry","war", "clan"]
        var apps: [App] = [App]()
        
        let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem", screenShots: [""])
        
        let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""])
        
        let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""])
        apps = [app1, app2, app3]
        let headerItemGames = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Games", hideDiv: false)
        
        var configGames = ViewControllerConfigurator()
        configGames.appsArray = apps
        configGames.listArray = items
        configGames.headerItem = headerItemGames
        configGames.subHeaderTitle = "New Games we love"

        tabTwo.config = configGames
        
        
        let items2 = ["news","health", "money"]
        
        let app4 = App(appName: "Airbnb", appDesc: "New summer experiences to book", appID: 1, appCategory: "REDISCOVER THIS", appPrice: 0, appStory:"123", appPhoto: "home", screenShots: [""])
        
        let app5 = App(appName: "Landscapero", appDesc: "Find that sweet land", appID: 1, appCategory: "LOVE IT", appPrice: 0, appStory:"123", appPhoto: "landscape", screenShots: [""])
        
        let app6 = App(appName: "Trainaija", appDesc: "Nigeria leads in train tech", appID: 1, appCategory: "UPCOMING", appPrice: 0, appStory:"123", appPhoto: "train", screenShots: [""])
        
        let apps2 = [app4, app5, app6]
        let headerItemApps = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Apps", hideDiv: false)
        
        var configApp = ViewControllerConfigurator()
        configApp.appsArray = apps2
        configApp.listArray = items2
        configApp.headerItem = headerItemApps
        configApp.subHeaderTitle = "New Apps we love"
        
        tabThree.config = configApp
        
    }
    
    func createTabItems() {
        
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }

    override func viewWillDisappear(_ animated: Bool) {
        showNavBar()
    }

}

