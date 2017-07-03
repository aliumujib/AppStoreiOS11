//
//  BaseSectionedListController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/1/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class BaseSectionedListController: DatasourceController {
    
    var sectionItems: [String]?{
        didSet{
            collectionView?.reloadData()
        }
    }
    
    public var sectionTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                
        if(kind == UICollectionElementKindSectionHeader){
            
            if let header = (collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(GeneralHeaderCell.self), for: indexPath) as? GeneralHeaderCell){
                
                if let title = sectionTitle{
                    
                    let headerItem = HeaderItem(smallTitle: "\t".uppercased(), bigTitle: title, hideDiv: false)
                    
                    
                    header.headerItem = headerItem
                    
                    return header
                    
                }
              
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
        return CGSize(width: view.frame.width, height: 115)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        super.collectionView(collectionView, cellForItemAt: indexPath)
        
        if (indexPath.section != 0){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SmallListHolderCell.self), for: indexPath) as? SmallListHolderCell
            {
                print(sectionItems?.count)
                //USe the section to access array instead of index, the offset by one
//                if(!(sectionItems?.isEmpty)!){
//                    cell.searchTerm = sectionItems?[indexPath.section - 1]
//                    return cell
//                }
            }
        }
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LargePhotoHorizontalCollectionViewCell.self), for: indexPath)
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
