//
//  SmallAppListHolderCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/30/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents
import Alamofire


class SmallListHolderCell: DatasourceCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var appSelectedDelegate: OnAppSelectedDelegate? = nil
    
    var searchTerm : String?{
        didSet{
            if let s = searchTerm{
                getData(searchTerm: s)
            }
        }
    }
    
    var collectionView : UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    
    var apps = [App]()
    
    override func setupViews() {
        addSubview(collectionView)
        
        self.backgroundColor = .white
        
        collectionView.fillSuperview()
        
        //        divider.anchor(nil, left: collectionView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        collectionView.register(SmallAppCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:
        IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? SmallAppCell
        {
            cell.app = apps[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let app = apps[indexPath.row]
        print("SENT")
        appSelectedDelegate?.setSelectedApp(app: app)
    }
    
    func getData(searchTerm: String) {
        let headers: HTTPHeaders = ["X-Apptweak-Key": "ZZtdPAFn2e4TlvAqQZ_9TTlZlx4"]
        Alamofire.request("https://api.apptweak.com/ios/searches.json?term=\(searchTerm)&country=us&language=us&device=iphone", headers: headers).responseJSON { response in
            
            //print(response)
            
            if let result  = response.result.value as? Dictionary<String, Any>{
                
                if let mainDict = result["content"] as? [Dictionary<String, Any>]{
                    if !mainDict.isEmpty{
                        for article in mainDict{
                            var app = App()
                            app.appName = article["title"] as! String!
                            app.appDesc = article["developer"] as! String!
                            app.appPhoto = article["icon"] as! String!
                            app.appID = article["id"] as! Int!
                            app.appCategory = article["price"] as! String!
                            app.appRating = article["rating"] as! Double
                            self.apps.append(app)
                        }
                        self.collectionView.reloadData()
                    }
                }
            }
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 32, height: 95)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    
}
