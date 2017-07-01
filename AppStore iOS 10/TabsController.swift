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
        let tabTwo = GamesController()
        let tabTwoBarItem = UITabBarItem(title: "Games", image: UIImage(named: "games"), selectedImage: UIImage(named: "games")?.maskWithColor(color: .blue))
        
        // Create Tab three
        let tabThree = AppsViewController()
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

        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("Selected \(viewController.title!)")
    }


}

