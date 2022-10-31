//
//  OutfitsCollectionViewCell.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/12.
//

import UIKit
/*
class OutfitsCollectionViewCell: UICollectionViewCell {
    static let identifier = "OutfitsCollectionViewCell"
    var mainImage = UIImageView()
    var likeButton = UIButton()
    var wearButton = UIButton()
    var liked : Bool?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.frame = contentView.bounds
        configureLikeButton()
        configureWearButton()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImage.image = nil
    }
    
    func configureLikeButton(){
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.clipsToBounds = true
        likeButton.contentMode = .scaleAspectFill
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leadingAnchor.constraint(equalTo: contentView.rightAnchor, constant: 15).isActive = true
        likeButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    func configureWearButton(){
        wearButton.setImage(UIImage(systemName: "plus"), for: .normal)
        wearButton.clipsToBounds = true
        wearButton.contentMode = .scaleAspectFill
        
        wearButton.translatesAutoresizingMaskIntoConstraints = false
        wearButton.leadingAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        wearButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        wearButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        wearButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 20.0
        contentView.clipsToBounds = true
        self.contentView.layer.backgroundColor = UIColor.gray.cgColor
        self.contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.shadowRadius = 2
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.addSubview(mainImage)
        self.addSubview(likeButton)
        self.addSubview(wearButton)
        
        self.layoutSubviews()
        //fatalError("init(coder:) has not been implemented")
    }
    
    
}

struct Outfit{
    var uuidString: String
    var outfitName : String
    var tags : String
    //todo: tags should be string array
    var details : String?
    //details do not have to be necessary
    var isLiked : Bool
    //var items : [Item]
    var savedDate : Date
    //var usedItems : [Item]?
}*/
