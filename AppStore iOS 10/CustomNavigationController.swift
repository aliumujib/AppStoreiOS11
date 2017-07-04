//
//  CustomNavigationController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/4/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Make color of title
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        
        self.navigationBar.tintColor = UIColor(red: 5/255, green: 123/255, blue: 253/255, alpha: 1)
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.barTintColor = UIColor.white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}
