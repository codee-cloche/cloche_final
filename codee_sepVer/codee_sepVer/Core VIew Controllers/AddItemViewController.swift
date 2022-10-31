//
//  AddItemViewController.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/19.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var cancelButton = UIButton()
    var saveButton = UIButton()
    
    var titleLabel = UILabel()
    var outfitTitleField = UITextField()
    var underLine1 = UIImageView()
    
    var itemChooseLabel = UILabel()
    //var itemChooseView = UICollectionView()
    var itemChooseView = UIView()
    
    var categoryLabel = UILabel()
    var categoryButton = UIButton()
    var underLine2 = UIImageView()
    //category button text should change depending on model
    
    var colorLabel = UILabel()
    var colorView = UIStackView()
    var underLine3 = UIImageView()
    //color button color should change depending on model
    
    var tagLabel = UILabel()
    var tagField = UITextField()
    var underLine4 = UIImageView()
    var detailField = UITextField()
    var underLine5 = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        configureSubViews()
        // Do any additional setup after loading the view.
    }
    
    func addSubviews(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(outfitTitleField)
        self.view.addSubview(underLine1)
        
        self.view.addSubview(itemChooseLabel)
        self.view.addSubview(itemChooseView)
         
        self.view.addSubview(categoryLabel)
        self.view.addSubview(categoryButton)
        self.view.addSubview(underLine2)
        
        self.view.addSubview(colorLabel)
        self.view.addSubview(colorView)
        self.view.addSubview(underLine3)
       
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagField)
        self.view.addSubview(underLine4)
        
        self.view.addSubview(detailField)
        self.view.addSubview(underLine5)
    }
    
    
    func configureSubViews(){
        configureNavController()
        
        configureOutfitTitleField()
        
        configureItemChooseLabel()
        configureItemChooseView()
        
        configureCategoryField()
        configureColorField()
        
        configureTagField()
        
        configureDetailField()
    }
    
    func configureNavController(){
        self.navigationItem.title = "아이템 추가"
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        
        
        cancelButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        cancelButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        
        let rightButton = UIBarButtonItem(customView: saveButton)
        let leftButton = UIBarButtonItem(customView: cancelButton)
        
        self.navigationItem.setRightBarButton(rightButton, animated: true)
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    
    @objc func didTapSave(){
        //save function
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapCancel(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func configureOutfitTitleField(){
        titleLabel.text = "아이템명"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        
        outfitTitleField.placeholder = "Item 100"
        //TODO: this controller should get num of items and change placeholder.
        outfitTitleField.setLeftPaddingPoints(10)
        
        outfitTitleField.autocorrectionType = .no
        outfitTitleField.autocapitalizationType = .none
        outfitTitleField.layer.masksToBounds = true
        outfitTitleField.borderStyle = .none
        outfitTitleField.textColor = .systemGray
        
        outfitTitleField.translatesAutoresizingMaskIntoConstraints = false
        outfitTitleField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        outfitTitleField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        outfitTitleField.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        outfitTitleField.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48-titleLabel.frame.width).isActive = true
        
        let lineImage = UIImage(named: "underline")
        underLine1.image = lineImage
        underLine1.translatesAutoresizingMaskIntoConstraints = false
        underLine1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine1.topAnchor.constraint(equalTo: self.outfitTitleField.bottomAnchor, constant: 2).isActive = true
        underLine1.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    

    func configureItemChooseLabel(){
        itemChooseLabel.text = "사진 선택"
        itemChooseLabel.textColor = .black
        itemChooseLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
       
        itemChooseLabel.translatesAutoresizingMaskIntoConstraints = false
        itemChooseLabel.topAnchor.constraint(equalTo: self.underLine1.bottomAnchor, constant: 30).isActive = true
        itemChooseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
    }
    
    func configureItemChooseView(){
        //should make another table view for this
        itemChooseView.layer.borderWidth = 0.3
        itemChooseView.layer.cornerRadius = 8.0
        itemChooseView.layer.borderColor = UIColor.systemGray.cgColor
        
        itemChooseView.translatesAutoresizingMaskIntoConstraints = false
        itemChooseView.topAnchor.constraint(equalTo: self.itemChooseLabel.bottomAnchor, constant: 10).isActive = true
        itemChooseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        itemChooseView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        itemChooseView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
   
    func configureCategoryField(){
        //category label, button and line
        categoryLabel.text = "카테고리"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
        categoryLabel.topAnchor.constraint(equalTo: self.itemChooseView.bottomAnchor, constant: 30).isActive = true
        
        categoryButton.setTitle("아우터", for: .normal)
        categoryButton.setTitleColor(.black, for: .normal)
        categoryButton.layer.cornerRadius = 8
        categoryButton.addTarget(self, action: #selector(didTapChangeCategory), for: .touchUpInside)
        categoryButton.layer.backgroundColor = UIColor(red: 73/255.0, green: 128/255.0, blue: 211/255.0, alpha: 0.5).cgColor
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.leftAnchor.constraint(equalTo: self.categoryLabel.rightAnchor, constant: 10).isActive = true
        categoryButton.centerYAnchor.constraint(equalTo: self.categoryLabel.centerYAnchor).isActive = true
        categoryButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        categoryButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        categoryButton.clipsToBounds = true
        
        let lineImage = UIImage(named: "underline")
        underLine2.image = lineImage
        underLine2.translatesAutoresizingMaskIntoConstraints = false
        underLine2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine2.topAnchor.constraint(equalTo: self.categoryButton.bottomAnchor, constant: 4).isActive = true
        underLine2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
    @objc func didTapChangeCategory(){
        
    }
    
    func configureColorField(){
        //color label, buttons, and line
        //TODO: gets an array of colors from models
        colorLabel.text = "색상"
        colorLabel.textColor = .black
        colorLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
        colorLabel.topAnchor.constraint(equalTo: self.underLine2.bottomAnchor, constant: 30).isActive = true
        
        let colors : [UIColor] = [UIColor(red: 212/255.0, green: 212/255.0, blue: 167/255.0, alpha: 1.0),
                                  UIColor(red: 175/255.0, green: 174/255.0, blue: 206/255.0, alpha: 1.0),
                                  UIColor(red: 90/255.0, green: 90/255.0, blue: 90/255.0, alpha: 1.0),]
        
        for one_color in colors {
            let color_button = UIButton()
            colorView.addSubview(color_button)
            color_button.layer.backgroundColor = one_color.cgColor
            color_button.layer.cornerRadius = 8
            color_button.translatesAutoresizingMaskIntoConstraints = false
            color_button.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor).isActive = true
            color_button.widthAnchor.constraint(equalToConstant: 25).isActive = true
            color_button.heightAnchor.constraint(equalToConstant: 25).isActive = true
            //colorButtons.append(color_button)
        }
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.axis = .horizontal
        colorView.distribution = .equalSpacing
        colorView.leadingAnchor.constraint(equalTo: self.colorLabel.trailingAnchor, constant: 10).isActive = true
        colorView.centerYAnchor.constraint(equalTo: self.colorLabel.centerYAnchor).isActive = true
        colorView.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(34*colors.count)).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let lineImage = UIImage(named: "underline")
        underLine3.image = lineImage
        underLine3.translatesAutoresizingMaskIntoConstraints = false
        underLine3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine3.topAnchor.constraint(equalTo: self.colorView.bottomAnchor, constant: 4).isActive = true
        underLine3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
    func configureTagField(){
        //TODO: make the textfield parse the text with # or space
        tagLabel.text = "#태그"
        tagLabel.textColor = .black
        tagLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
        tagLabel.topAnchor.constraint(equalTo: self.underLine3.bottomAnchor, constant: 50).isActive = true
        
        tagField.setLeftPaddingPoints(10)
        tagField.autocorrectionType = .no
        tagField.autocapitalizationType = .none
        tagField.borderStyle = .none
        
        tagField.translatesAutoresizingMaskIntoConstraints = false
        tagField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tagField.leadingAnchor.constraint(equalTo: tagLabel.trailingAnchor, constant: 10).isActive = true
        tagField.centerYAnchor.constraint(equalTo: self.tagLabel.centerYAnchor).isActive = true
        tagField.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48-tagLabel.frame.width).isActive = true
        
        let lineImage = UIImage(named: "underline")
        underLine4.image = lineImage
        underLine4.translatesAutoresizingMaskIntoConstraints = false
        underLine4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine4.topAnchor.constraint(equalTo: self.tagField.bottomAnchor, constant: 2).isActive = true
        underLine4.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
    func configureDetailField(){
        detailField.attributedPlaceholder = NSAttributedString(string: "정보 추가하기", attributes: [
           .foregroundColor: UIColor.systemGray,
           .font: UIFont.systemFont(ofSize: 16.0)
           //.font: UIFont.boldSystemFont(ofSize: 16.0)
       ])
       
        //detailField.setLeftPaddingPoints(10)
        detailField.autocorrectionType = .no
        detailField.autocapitalizationType = .none
        detailField.borderStyle = .none
        detailField.textColor = .systemGray
        
        detailField.translatesAutoresizingMaskIntoConstraints = false
        detailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        detailField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        detailField.topAnchor.constraint(equalTo: self.tagField.bottomAnchor, constant: 10).isActive = true
        detailField.widthAnchor.constraint(equalTo:self.view.widthAnchor, constant: -48).isActive = true
        
        let lineImage = UIImage(named: "underline")
        underLine5.image = lineImage
        underLine5.translatesAutoresizingMaskIntoConstraints = false
        underLine5.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine5.topAnchor.constraint(equalTo: self.detailField.bottomAnchor, constant: 2).isActive = true
        underLine5.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
}

