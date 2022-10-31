//
//  AddOutfitViewController.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/12.
//

import UIKit

class AddOutfitViewController: UIViewController {
    
    var cancelButton = UIButton()
    var saveButton = UIButton()
    
    var titleLabel = UILabel()
    var outfitTitleField = UITextField()
    var underLine1 = UIImageView()
    
    var itemChooseLabel = UILabel()
    //var itemChooseView = UICollectionView()
    var itemChooseView = UIView()
    
    var photoChooseLabel = UILabel() 
    //var photoChooseView = UICollectionView()
    var photoChooseView = UIView()
    
    var tagLabel = UILabel()
    var tagField = UITextField()
    var underLine2 = UIImageView()
    var detailField = UITextField()
    var underLine3 = UIImageView()
    
    //var randomPicker = UIButton()
    //TODO: maybe random picker should be in another view controller?
    
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
        
        self.view.addSubview(photoChooseLabel)
        self.view.addSubview(photoChooseView)
        
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagField)
        self.view.addSubview(underLine2)
        
        self.view.addSubview(detailField)
        self.view.addSubview(underLine3)
        
        //self.view.addSubview(randomPicker)
    }
    
    
    func configureSubViews(){
        configureNavController()
        
        configureOutfitTitleField()
        
        configureItemChooseLabel()
        configureItemChooseView()
        
        configurePhotoChooseLabel()
        configurePhotoChooseView()
        
        configureTagField()
        
        configureDetailField()
        
        //configureRandomPickerButton()
    }
    
    func configureNavController(){
        self.navigationItem.title = "조합 추가"
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
        
    }
    
    @objc func didTapCancel(){
        
    }
    
    func configureOutfitTitleField(){
        titleLabel.text = "조합명"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        
        outfitTitleField.placeholder = "Outfit 100"
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
        itemChooseLabel.text = "아이템 선택"
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
    
    func configurePhotoChooseLabel(){
        photoChooseLabel.text = "착샷 추가"
        photoChooseLabel.textColor = .black
        photoChooseLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)

        photoChooseLabel.translatesAutoresizingMaskIntoConstraints = false
        photoChooseLabel.topAnchor.constraint(equalTo: self.itemChooseView.bottomAnchor, constant: 30).isActive = true
        photoChooseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
    }
    
    func configurePhotoChooseView(){
        //should make another table view for this
        photoChooseView.layer.borderWidth = 0.3
        photoChooseView.layer.cornerRadius = 8.0
        photoChooseView.layer.borderColor = UIColor.systemGray.cgColor
        
        photoChooseView.translatesAutoresizingMaskIntoConstraints = false
        photoChooseView.topAnchor.constraint(equalTo: self.photoChooseLabel.bottomAnchor, constant: 10).isActive = true
        photoChooseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        photoChooseView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        photoChooseView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
    func configureTagField(){
        //TODO: make the textfield parse the text with # or space
        tagLabel.text = "#태그"
        tagLabel.textColor = .black
        tagLabel.font = UIFont(name: "AppleSDGothicNeo", size: 15)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
        tagLabel.topAnchor.constraint(equalTo: self.photoChooseView.bottomAnchor, constant: 30).isActive = true
        
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
        underLine2.image = lineImage
        underLine2.translatesAutoresizingMaskIntoConstraints = false
        underLine2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine2.topAnchor.constraint(equalTo: self.tagField.bottomAnchor, constant: 2).isActive = true
        underLine2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
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
        underLine3.image = lineImage
        underLine3.translatesAutoresizingMaskIntoConstraints = false
        underLine3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        underLine3.topAnchor.constraint(equalTo: self.detailField.bottomAnchor, constant: 2).isActive = true
        underLine3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
    }
    
    /*
    func configureRandomPickerButton(){
        randomPicker.setTitle("이 날씨에 뭐 입지?", for: .normal)
        randomPicker.layer.masksToBounds = true
        randomPicker.titleLabel?.textAlignment = .center
        randomPicker.titleLabel?.textColor = .white
        randomPicker.backgroundColor = .systemBlue
        randomPicker.layer.cornerRadius = 8.0
        
        randomPicker.translatesAutoresizingMaskIntoConstraints = false
        randomPicker.heightAnchor.constraint(equalToConstant: 80).isActive = true
        randomPicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        randomPicker.topAnchor.constraint(equalTo: detailField.bottomAnchor, constant: 40).isActive = true
        randomPicker.widthAnchor.constraint(equalToConstant: self.view.frame.width - 48).isActive = true
    }*/
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: 40))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

