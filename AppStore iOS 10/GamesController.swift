//
//  GamesController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class GamesController: DatasourceController, OnAppSelectedDelegate {

    let items = ["angry","war", "clan"]
    
    
    let app1 = App(appName: "Injustice", appDesc: "When iconic superheroes collide", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "batmandem", screenShots: [""])
    
    let app2 = App(appName: "Cubic Cosmos", appDesc: "When geometry arrives space", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "cubic_cosmos", screenShots: [""])
    
    let app3 = App(appName: "Monument Valley", appDesc: "Inside the iconic sequel", appID: 1, appCategory: "NEW GAME", appPrice: 0, appStory:"123", appPhoto: "mirage", screenShots: [""])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.showsVerticalScrollIndicator = false
        
        let gamesDataSource = GamesDataSource()
        self.datasource = gamesDataSource
        
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
    
    func setSelectedApp(app: App) {
        let appDetailVC = AppDetailViewController()
        appDetailVC.app = app
        self.show(appDetailVC, sender: appDetailVC)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header : UICollectionViewCell
        
        if(kind == UICollectionElementKindSectionHeader){
            
           if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self), for: indexPath) as? GeneralHeaderCell){
            
                let headerItem = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: "Games", hideDiv: false)
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
                cell.appSelectedDelegate = self
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
