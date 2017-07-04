//
//  UpdatesViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/4/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import AZSearchView

class UpdatesViewController: AppListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Service.sharedInstance.getAppSearch(searchTerm: "Travel") { (applications) in
            print("DONE WITH RETRIEVAL")
            
            self.apps = applications
            self.collectionView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNavBar()
        self.tabBarController?.navigationItem.title = "Updates"

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


class SearchViewController: AppListViewController, AZSearchViewDelegate, AZSearchViewDataSource{
    
    func results() -> [String] {
        return [""]
    }

    var resultArray:[String] = []
    var searchController:AZSearchViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = AZSearchViewController()
        
        self.searchController.delegate = self
        self.searchController.dataSource = self
        
        self.searchController.searchBarPlaceHolder = "Search Apps"
        self.searchController.searchBarBackgroundColor = .white
        self.searchController.statusBarStyle = .default
        self.searchController.keyboardAppearnce = .default
        self.searchController.separatorColor = .clear
        
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(self.showSearchBar(sender:)))
        self.tabBarController?.navigationItem.rightBarButtonItem = button
        
        //Add bar button item on the navigation bar using the navigation item.
        let item = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.close(sender:)))
        item.tintColor = .white
        self.searchController.navigationItem.rightBarButtonItem = item

        // Do any additional setup after loading the view.
    }
    
    func showSearchBar(sender:AnyObject?)  {
        self.searchController.show(in: (self.tabBarController?.navigationController!)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNavBar()
        self.tabBarController?.navigationItem.title = "Search"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.navigationItem.title = ""
    }
    
    func searchView(_ searchView: AZSearchViewController, didSearchForText text: String) {
        searchView.dismiss(animated: false, completion: nil)
        searchDBForItems(searchQuery: text.lowercased())
    }
    
    func searchView(_ searchView: AZSearchViewController, didTextChangeTo text: String, textLength: Int) {
        
    }
    
    func searchDBForItems(searchQuery: String) {
        Service.sharedInstance.getAppSearch(searchTerm: searchQuery) { (applications) in
            self.apps = applications
            self.collectionView.reloadData()
        }
    }
    
    func searchView(_ searchView: AZSearchViewController, didSelectResultAt index: Int, text: String) {
        self.searchController.dismiss(animated: true, completion: {
            self.pushWithTitle(text: text)
        })
    }
    
    
    
    func searchView(_ searchView: AZSearchViewController, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }

    func close(sender:AnyObject?){
        searchController.dismiss(animated: true)
    }
    
    func searchView(_ searchView: AZSearchViewController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchView.cellIdentifier)
        
        return cell!
    }
    
    func searchView(_ searchView: AZSearchViewController, tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func searchView(_ searchView: AZSearchViewController, tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let remove = UITableViewRowAction(style: .destructive, title: "Remove") { action, index in
            self.resultArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //searchView.reloadData()
        }
        
        return [remove]
    }

    
    ///this function is for demo purposes only
    func pushWithTitle(text: String){
        let controller = UIViewController()
        controller.title = text
        controller.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
