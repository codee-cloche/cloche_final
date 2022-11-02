//
//  FilterListCollectionViewCell.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

///cell for showing item/outfit in collection view
class FilterListCollectionViewCell: UICollectionViewCell {
    var itemImage = UIImageView()
    var likeButton = UIButton()
    
    override var reuseIdentifier: String {
        return "FilterListCollectionViewCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(itemImage)
        self.contentView.addSubview(likeButton)
        applyDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configureDesign(imageName: String, liked: Bool){
        self.itemImage.image = UIImage(named: imageName)
        if (liked){
            self.likeButton.isSelected = true
        }else {
            self.likeButton.isSelected = false
        }
    }
    
    private func applyDesign(){
        self.itemImage.translatesAutoresizingMaskIntoConstraints = false
        self.itemImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.itemImage.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.itemImage.widthAnchor.constraint(equalToConstant: 151).isActive = true
        self.itemImage.heightAnchor.constraint(equalToConstant: 223).isActive = true
        self.itemImage.contentMode = .scaleToFill
        self.itemImage.layer.masksToBounds = true
        self.itemImage.layer.cornerRadius = 25
        
        self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        self.likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.topAnchor.constraint(equalTo: self.itemImage.topAnchor, constant: 10).isActive = true
        self.likeButton.trailingAnchor.constraint(equalTo: self.itemImage.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func didTapLike(){
        
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
               //move to detail view of item
            }
        }
    }
    
}
