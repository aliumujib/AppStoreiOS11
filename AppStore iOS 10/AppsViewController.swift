//
//  AppsViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import LBTAComponents

class AppsViewController: DatasourceController {
    
    let items = ["news","health", "money"]
    
    let app1 = App(appName: "Airbnb", appDesc: "New summer experiences to book", appID: 1, appCategory: "REDISCOVER THIS", appPrice: 0, appStory:"123", appPhoto: "home", screenShots: [""])
    
    let app2 = App(appName: "Landscapero", appDesc: "Find that sweet land", appID: 1, appCategory: "LOVE IT", appPrice: 0, appStory:"123", appPhoto: "landscape", screenShots: [""])
    
    let app3 = App(appName: "Trainaija", appDesc: "Nigeria leads in train tech", appID: 1, appCategory: "UPCOMING", appPrice: 0, appStory:"123", appPhoto: "train", screenShots: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gamesDataSource = GamesDataSource()
        self.datasource = gamesDataSource
        collectionView?.showsVerticalScrollIndicator = false

        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.sectionHeadersPinToVisibleBounds = true
            collectionView?.showsHorizontalScrollIndicator = false
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header : UICollectionViewCell
        
        if(kind == UICollectionElementKindSectionHeader){
            
            if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self), for: indexPath) as? GeneralHeaderCell){
                
                let headerItem = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Apps", hideDiv: false)
                header.headerItem = headerItem
                
                return header
                
            }
            
        }else{
            if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(DividerFooter.self), for: indexPath) as? DividerFooter){
                if(indexPath.section != 0){
                    header.smallSectionDivider = true
                }else{
                    header.smallSectionDivider = false
                }
                return header
            }
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
            return CGSize(width: view.frame.width, height: 318)
        }
        return CGSize(width: view.frame.width, height: 95)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        super.collectionView(collectionView, cellForItemAt: indexPath)
        
        if (indexPath.section != 0){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SmallListHolderCell.self), for: indexPath) as? SmallListHolderCell
            {
                //USe the section to access array instead of
                cell.searchTerm = items[indexPath.section - 1]
                return cell
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LargePhotoHorizontalCollectionViewCell.self), for: indexPath) as! LargePhotoHorizontalCollectionViewCell
            cell.dummyData = [app1, app2, app3]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section != 0){
            return .zero
        }
        return CGSize(width: view.frame.width, height: 95)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if(section != 0){
            return CGSize(width: view.frame.width, height: 25)
        }
        return CGSize(width: view.frame.width, height: 25)
    }
    
    
}
