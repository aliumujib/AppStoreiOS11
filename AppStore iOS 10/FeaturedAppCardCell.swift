//
//  FeaturedAppCardCell.swift
//  AppStore iOS 10
//
//  Created by Abdul-Mujeeb Aliu on 6/29/17.
//  Copyright © 2017 Abdul-Mujeeb Aliu. All rights reserved.
//

import LBTAComponents

class FeaturedAppCardCell: DatasourceCell {
    


    override var datasourceItem: Any? {
        didSet{
            if let todayArticle = self.datasourceItem as? TodayArticle{
                imageBg.image = UIImage(named: (todayArticle.photo)!)
                smallTitle.text = todayArticle.smallTitle
                bigTitle.text = todayArticle.bigTitle
                smallDescription.text = todayArticle.briefDescription
            }
        }
    }
    
    func bindData(todayArticle: TodayArticle) {
        imageBg.image = UIImage(named: (todayArticle.photo)!)
        smallTitle.text = todayArticle.smallTitle
        bigTitle.text = todayArticle.bigTitle
        smallDescription.text = todayArticle.briefDescription
    }
    
    
    var cardView : CardView = {
        let cv = CardView()
        cv.cornerRadius = 20
        return cv
    }()
    
    var imageBg : UIImageView = {
        let imgBG = UIImageView()
        imgBG.image = #imageLiteral(resourceName: "good_living")
        imgBG.contentMode = .scaleAspectFit
        return imgBG
    }()
    
    var smallTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "EXPLORE".uppercased()
        //label.textColor = UIColor(white: 1, alpha: 0.4)
        return label
    }()
    
    var bigTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.text = "The Beauty of modern Living"
        return label
    }()
    
    var smallDescription : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Pimp up your home with the best design classics and smart helpers"
        //label.textColor = UIColor(white: 1, alpha: 0.4)
        return label
    }()
    

    
    override func setupViews() {
        super.setupViews()
        
        layoutViews()
    }
    
    
    func layoutViews() {
        
        addSubview(cardView)
        addSubview(imageBg)
        addSubview(smallTitle)
        addSubview(bigTitle)
        addSubview(smallDescription)
        
        cardView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        imageBg.anchor(cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        smallTitle.anchor(imageBg.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        bigTitle.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 120, widthConstant: 0, heightConstant: 0)
        
        smallDescription.anchor(nil, left: smallTitle.leftAnchor, bottom: bottomAnchor, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)

    }
    
}
