//
//  SearchUpdatesViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit

class SearchUpdatesViewController: UIViewController {

    var config : ViewControllerConfigurator?{
        didSet{
            self.navigationController?.title = config?.title
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        if let navBar = self.navigationController?.navigationBar{
            navBar.isTranslucent = false
            navBar.backgroundColor = .white
            print("KILONSELE, MOTISETAN MEHN")
        }
        
//        let navBar = self.navigationController!.navigationBar
//        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navBar.shadowImage = UIImage()
//        navBar.isTranslucent = false
//        navBar.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showNavBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hideNavBar()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
