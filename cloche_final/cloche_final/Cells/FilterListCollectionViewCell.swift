//
//  FilterListCollectionViewCell.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit
import RxSwift
import RxGesture

///cell for showing item/outfit in collection view
class FilterListCollectionViewCell: UICollectionViewCell {
    var itemImage = UIImageView()
    var likeButton = UIButton()
    let disposeBag = DisposeBag()
    var item = Item(id: 0, name: "", category: "", liked: false)
    
    
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
    
    public func configureDesign(imageName: String, liked: Bool, item: Item){
        self.item = item
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
        self.itemImage.widthAnchor.constraint(equalToConstant: 104).isActive = true
        self.itemImage.heightAnchor.constraint(equalToConstant: 125).isActive = true
        self.itemImage.contentMode = .scaleToFill
        self.itemImage.layer.masksToBounds = true
        self.itemImage.layer.cornerRadius = 25
        
        self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        self.likeButton.tintColor = .lightGray
        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        //self.likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.topAnchor.constraint(equalTo: self.itemImage.topAnchor, constant: 10).isActive = true
        self.likeButton.trailingAnchor.constraint(equalTo: self.itemImage.trailingAnchor, constant: -10).isActive = true
        
        self.likeButton.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.likeButton.animateClick {
                    let liked = self.item.liked
                    if (!liked) {
                        LikedItemsState.shared.addLikedItem(new_item: self.item)
                        self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                        self.likeButton.tintColor = .black
                    } else {
                        print("liked item")
                        LikedItemsState.shared.deleteLikedItem(new_item: self.item)
                        self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                        self.likeButton.tintColor = .lightGray
                    }
                    self.item.liked = !liked
                }
            }
            .disposed(by: disposeBag)
    }
    
    /*
    @objc func didTapLike(){
        let liked = self.item.liked
        
        if (!liked) {
            LikedItemsState.shared.addLikedItem(new_item: self.item)
            self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.likeButton.tintColor = .black
        } else {
            print("liked item")
            LikedItemsState.shared.deleteLikedItem(new_item: self.item)
            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.likeButton.tintColor = .black
        }
        self.item.liked = !liked
        
    }*/
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
               //move to detail view of item
//                print("isselected")
            }
        }
    }
    
}
