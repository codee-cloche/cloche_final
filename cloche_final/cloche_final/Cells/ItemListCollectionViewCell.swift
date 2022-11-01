//
//  ItemListCollectionViewCell.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

///cell for showing the items in the list view
class ItemListCollectionViewCell: UICollectionViewCell {
    var pictureImage = UIImageView()
    var nameLabel = UILabel()
    
    var divider_top = UIImageView()
    
    
    override var reuseIdentifier: String {
        return "ItemsListCollectionViewCell"
    }
    
    override init(frame: CGRect) {
           super.init(frame: .zero)
           self.contentView.backgroundColor = .clear
           self.contentView.addSubview(pictureImage)
           self.contentView.addSubview(nameLabel)
        
        
        applyDesign()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureDesign(imageName: String, title: String){
        //init 2
        self.pictureImage.image = UIImage(named: imageName)
        self.nameLabel.text = title
    }
    
    private func applyDesign(){
        self.pictureImage.translatesAutoresizingMaskIntoConstraints = false
        self.pictureImage.setupCornerRadius(20)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.pictureImage.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.pictureImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.pictureImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.pictureImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.pictureImage.layer.masksToBounds = true
        
        self.nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.font = UIFont.systemFont(ofSize: 13)
        
        
    }
    
    func configureDivider(){
        self.divider_top.image = UIImage(named: "divider_top")
        self.divider_top.translatesAutoresizingMaskIntoConstraints = false
        self.divider_top.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.divider_top.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        self.divider_top.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.divider_top.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.divider_top.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                //add halo affect + shadow
                self.pictureImage.layer.borderColor = UIColor.black.cgColor
                self.nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
                self.contentView.addSubview(divider_top)
                configureDivider()
                print(self.nameLabel.text as Any)
            }
            else {
                self.pictureImage.layer.borderColor = UIColor.lightGray.cgColor
                self.nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
                divider_top.removeFromSuperview()
            }
            
        }
        
    }
    
    

}
