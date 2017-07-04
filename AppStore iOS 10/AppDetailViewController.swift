//
//  AppDetailViewController.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 7/1/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    let footerID = "footerID"
    
    var collectionView : UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()
    
    var headerBG : UIView = {
        let whiteBG = UIView()
        return whiteBG
    }()
    
    
    
    var collectionViewAppCopy: App?
    
    var app: App? {
        didSet{
            appDetails.attributedText = getAttributedStringForDescDetail(app: app!)
            
            if let price = app?.appCategory{
                let attributedString = NSMutableAttributedString(string: price, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: UIColor.white])
                getBtn.setAttributedTitle(attributedString, for: .normal)
            }
            if let rating = app?.appRating{
                ratingBar.rating = rating
                ratingValue.text = "\(rating)"
            }
            
            if let url = app?.appPhoto{
                let url = URL(string: url)
                appIcon.kf.setImage(with: url)
            }
            
            if let appID = app?.appID{
                Service.sharedInstance.getAppDetails(appID: appID, completed: { (application) in
                    self.collectionViewAppCopy = application
                    self.collectionView.collectionViewLayout.invalidateLayout()
                    self.collectionView.reloadData()
                })
            }
            
        }
    }
    
    
    var ratingBar: CosmosView = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let rb = CosmosView()
        rb.rating = 4
        rb.settings.fillMode = .precise
        rb.settings.filledColor = lightGray
        rb.settings.emptyBorderColor = lightGray
        rb.settings.filledBorderColor = .white
        return rb
    }()
    
    var ratingValue : UILabel = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        let label = UILabel()
        label.text = "4.5"
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()

    var ratingCountLabel : UILabel = {
        //THIS IS JUST TERRIBLE, SHAMEFUL I AM BUT WILL REFACTOR ONCE I FIND A WAY
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        let label = UILabel()
        label.text = "201 Ratings"
        label.textColor = lightGray
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    var ageTV : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        var attributedString = NSMutableAttributedString()
        
        
        attributedString = NSMutableAttributedString(string: "\(98)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName: lightGray])
        
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        attributedString.append(NSAttributedString(string: "Age Rating", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))
        
        label.attributedText = attributedString
        
        return label
    }()
    
    var versionTV : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        var attributedString = NSMutableAttributedString()
        
        
        attributedString = NSMutableAttributedString(string: "\(2.3)\n".capitalized, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18), NSForegroundColorAttributeName: lightGray])
        
        let range = NSMakeRange(0, attributedString.string.characters.count)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        attributedString.append(NSAttributedString(string: "Version", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 10), NSForegroundColorAttributeName: lightGray]))

        
        label.attributedText = attributedString
        
        return label
    }()
    
    var inAppText : UILabel = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = lightGray
        label.numberOfLines = 0
        label.text =  "Offers In-App \nPurchases"
        return label
    }()
    
    var getBtn : UIButton = {
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        
        let backGroundImage = UIImage(color: headerBlue, size: CGSize(width: 30, height: 10))
        
        let btn = UIButton()
        btn.setBackgroundImage(backGroundImage, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitle("GET".uppercased(), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    var appDetails : UITextView = {
        let label = UITextView()
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()
    
    
    var appIcon : UIImageView = {
        let appICo = UIImageView()
        appICo.contentMode = .scaleToFill
        appICo.layer.cornerRadius = 12
        appICo.image = #imageLiteral(resourceName: "geometrics")
        appICo.clipsToBounds = true
        return appICo
    }()
    
    private var headerHeightContraint: NSLayoutConstraint!
    var screenheight : CGFloat!
    var screenwidth : CGFloat!
    
    var minHeight: CGFloat = 0.0
    var maxHeight: CGFloat = 145
    
    var previousScrollOffset : CGFloat = 0.0
    var headerHeightConstant: CGFloat!

    var fadables = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        screenheight = self.view.frame.size.height
        screenwidth = self.view.frame.size.width
        
        //setupVoiews to be faded during collapse
        fadables.append(appIcon)
        fadables.append(appDetails)
        fadables.append(getBtn)
        fadables.append(ratingBar)
        fadables.append(ratingValue)
        fadables.append(versionTV)
        fadables.append(ageTV)
        fadables.append(ratingValue)

        setUpNavBar()
        
        // Do any additional setup after loading the view.

        setupHeaderView()
        setUpCollectionView()
        
        print("FIRST HEADER HEIGHT \(maxHeight)")
        self.headerHeightConstant = self.maxHeight
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        //
        // Will implement header height logic here next
        //
        self.previousScrollOffset = scrollView.contentOffset.y
        
        var newHeight = self.headerHeightConstant
        
        if isScrollingDown {
            newHeight = max(self.minHeight, self.headerHeightConstant - abs(scrollDiff))
        } else if isScrollingUp {
            newHeight = min(self.maxHeight, self.headerHeightConstant + abs(scrollDiff))
        }
        
        if newHeight != self.headerHeightConstant {
            self.headerHeightConstant = newHeight
        }
        
//        if (newHeight?.isLessThanOrEqualTo(50))!{
//            self.navigationController?.title = collectionViewAppCopy?.appName
//        }else{
//            self.navigationController?.title = ""
//        }
                
        let range = self.maxHeight - self.minHeight
        let openAmount = self.headerHeightConstant - self.minHeight
        
        headerBG.frame = CGRect(x: headerBG.frame.origin.x, y: headerBG.frame.origin.y, width: screenwidth, height: openAmount)
        
        collectionView.frame = CGRect(x: 0, y: headerBG.frame.origin.y + headerBG.frame.size.height, width: screenwidth, height: screenheight - headerBG.frame.size.height)
        
        print("\(headerBG.frame)")
        let percentage = openAmount / range
        
        
        fadeViews(views: fadables, fadepercent: percentage)
    }
    
    func fadeViews(views: [UIView], fadepercent: CGFloat) {
        for view in views{
            view.alpha = fadepercent
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if(self.navigationController?.isNavigationBarHidden)!{
            showNavBar()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //hideNavBar()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section != -1{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
           return CGSize(width: collectionView.frame.width, height: 350)
        }else if(indexPath.section == 1){
            if let count = collectionViewAppCopy?.appReviews?.count , count != 0{
                return CGSize(width: collectionView.frame.width, height: 255)
            }
        }
        else if(indexPath.section == 2){
            //print(app?.appDesc)
            return CGSize(width: collectionView.frame.width, height: 450)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenShotCellID, for: indexPath) as? ScreenShotsHolderCell{
                cell.screenShotURLS = collectionViewAppCopy?.screenShots
                return cell
            }
        }
        
        if indexPath.section == 1{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewsCellID, for: indexPath) as? RatingCollectionViewCell{
                cell.reviews = collectionViewAppCopy?.appReviews
                return cell
            }
        }
        
        if indexPath.section == 2{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descCellID, for: indexPath) as? AppDescriptionCell{
                print("GOT TO SECTION 2")
                cell.appDesc = collectionViewAppCopy?.appDesc
                return cell
            }
        }
    
        
        return UICollectionViewCell() 
    }
    
    let screenShotCellID = "screenShotCellID"
    let descCellID = "descCellID"
    let reviewsCellID = "reviewsCellID"

    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(ScreenShotsHolderCell.self, forCellWithReuseIdentifier: screenShotCellID)
        collectionView.register(AppDescriptionCell.self, forCellWithReuseIdentifier: descCellID)
        collectionView.register(RatingCollectionViewCell.self, forCellWithReuseIdentifier: reviewsCellID)
        collectionView.register(DividerFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerID)
        collectionView.anchor(headerBG.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        self.automaticallyAdjustsScrollViewInsets = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupHeaderView() {
        view.addSubview(headerBG)
    
        headerBG.addSubview(appIcon)
        headerBG.addSubview(appDetails)
        headerBG.addSubview(getBtn)
        headerBG.addSubview(inAppText)
        headerBG.addSubview(ratingValue)
        headerBG.addSubview(ratingBar)
        headerBG.addSubview(ratingCountLabel)
        headerBG.addSubview(ageTV)
        headerBG.addSubview(versionTV)
        
        appIcon.anchor(headerBG.topAnchor, left: headerBG.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 16, rightConstant: 8, widthConstant: 90, heightConstant: 90)
        
        appDetails.anchor(appIcon.topAnchor, left: appIcon.rightAnchor, bottom: nil, right: headerBG.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 60)
        
        getBtn.anchor(appDetails.bottomAnchor, left: appDetails.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 0, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        inAppText.anchor(getBtn.topAnchor, left: getBtn.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
        headerBG.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 145)
        
        ratingValue.anchor(appIcon.bottomAnchor, left: appIcon.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ratingBar.anchor(ratingValue.topAnchor, left: ratingValue.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ratingCountLabel.anchor(ratingValue.bottomAnchor, left: ratingValue.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        ageTV.anchor(ratingValue.topAnchor, left: ratingBar.rightAnchor, bottom: nil, right: nil, topConstant: -8, leftConstant: 16, bottomConstant: 16, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        versionTV.anchor(ageTV.topAnchor, left: nil, bottom: nil, right: headerBG.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
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
