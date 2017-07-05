//
//  GamesController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/28/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class GamesAppsController:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, OnAppSelectedDelegate {

    
    var config : ViewControllerConfigurator? {
        didSet{
            if let config = config {
                if let apps = config.appsArray{
                    self.apps = apps
                }
                if let itemsArray = config.listArray {
                    self.items = itemsArray
                }
                if let header = config.headerItem{
                    self.headerItem = header
                }
                if let subheader = config.subHeaderTitle{
                    self.subHeaderTitle = subheader
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    var collectionView : UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    private   var items = [String]()
    private  var apps: [App] = [App]()
    private  var headerItem: HeaderItem!
    private var subHeaderTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.setCollectionViewLayout(layout, animated: true)
        }
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(LargePhotoHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LargePhotoHorizontalCollectionViewCell.self))
        
        collectionView.register(SmallListHolderCell.self, forCellWithReuseIdentifier: NSStringFromClass(SmallListHolderCell.self))
        
        collectionView.register(GeneralHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self))
        
        collectionView.register(DividerFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(DividerFooter.self))
        
        collectionView.register(SmallAppListHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(SmallAppListHeader.self))
        
        self.collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if(kind == UICollectionElementKindSectionHeader){
            
            if indexPath.section == 1{
                if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(SmallAppListHeader.self), for: indexPath) as? SmallAppListHeader){
                    
                    header.title = subHeaderTitle
                    return header
                    
                }
            }
            
           if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self), for: indexPath) as? GeneralHeaderCell){
            
                header.headerItem = self.headerItem
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
            return CGSize(width: view.frame.width, height: 318)
        }
        return CGSize(width: view.frame.width, height: 85)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.section != 0){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SmallListHolderCell.self), for: indexPath) as? SmallListHolderCell
            {
                //USe the section to access array instead of
                if(items.count > indexPath.item){
                    cell.searchTerm = items[indexPath.section - 1]
                }
                cell.appSelectedDelegate = self
                return cell
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LargePhotoHorizontalCollectionViewCell.self), for: indexPath) as! LargePhotoHorizontalCollectionViewCell
            cell.dummyData = apps
            return cell
        }
        
        return UICollectionViewCell()
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section != 0){
            if section == 1{
                return CGSize(width: view.frame.width, height: 25)
            }
            return .zero
        }
        return CGSize(width: view.frame.width, height: 95)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: view.frame.width, height: 20)
        }
        return CGSize(width: view.frame.width, height: 10)
    }


}
