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
        guard let image = UIImage(named: imageName) else { return }
        let cropped_image = cropToBounds(image: image, width: 50.0, height: 50.0)
        self.pictureImage.image = cropped_image
        self.nameLabel.text = title
    }
    
    private func applyDesign(){
        self.pictureImage.translatesAutoresizingMaskIntoConstraints = false
        self.pictureImage.setupCornerRadius(15)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.pictureImage.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.pictureImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.pictureImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.pictureImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.pictureImage.clipsToBounds =  true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.pictureImage.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.font = UIFont.systemFont(ofSize: 12)
        self.nameLabel.textColor = .gray
    }
    
    func configureDivider(){
        self.divider_top.image = UIImage(named: "divider_top")
        self.divider_top.translatesAutoresizingMaskIntoConstraints = false
        self.divider_top.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.divider_top.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        self.divider_top.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.divider_top.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.divider_top.heightAnchor.constraint(equalToConstant: 5).isActive = true
        //self.divider_top.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                //add halo affect + shadow to image
                self.pictureImage.layer.borderColor = UIColor.black.cgColor
                self.pictureImage.layer.borderWidth = 1
                self.pictureImage.layer.borderColor = UIColor.black.cgColor
                self.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
                //self.contentView.addSubview(divider_top)
                self.nameLabel.textColor = .black
                //configureDivider()
            }
            else {
                self.pictureImage.layer.borderColor = UIColor.lightGray.cgColor
                self.nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
                self.pictureImage.layer.borderWidth = 0
                self.pictureImage.layer.borderColor = UIColor.clear.cgColor
                self.nameLabel.textColor = .gray
                //divider_top.removeFromSuperview()
            }
            
        }
        
    }
    
    ///changes size of image to width and height, returns cropped image
    func cropToBounds(image: UIImage, width: Double, height: Double)->UIImage {

            let cgimage = image.cgImage!
            let contextImage: UIImage = UIImage(cgImage: cgimage)
            let contextSize: CGSize = contextImage.size
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = CGFloat(width)
            var cgheight: CGFloat = CGFloat(height)

            // See what size is longer and create the center off of that
            if contextSize.width > contextSize.height {
                posX = ((contextSize.width - contextSize.height) / 2)
                posY = 0
                cgwidth = contextSize.height
                cgheight = contextSize.height
            } else {
                posX = 0
                posY = ((contextSize.height - contextSize.width) / 2)
                cgwidth = contextSize.width
                cgheight = contextSize.width
            }

            let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

            // Create bitmap image from context using the rect
            let imageRef: CGImage = cgimage.cropping(to: rect)!

            // Create a new image based on the imageRef and rotate back to the original orientation
            let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

            return image
        }
    
    
    
    

}
