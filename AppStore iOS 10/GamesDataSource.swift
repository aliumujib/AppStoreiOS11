//
//  GamesDataSource.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class GamesDataSource: Datasource {
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [GeneralHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [DividerFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [LargePhotoHorizontalCollectionViewCell.self, SmallListHolderCell.self, SmallListHolderCell.self]
    }
    
    
    override func numberOfSections() -> Int {
        return 4
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
}
