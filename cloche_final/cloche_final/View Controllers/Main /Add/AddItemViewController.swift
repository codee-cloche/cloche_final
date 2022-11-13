//
//  AddItemViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/02.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    
    var titleLabel = UILabel()
    var outfitTitleField = UITextField()
    var underLine1 = UILabel()
        
    var itemChooseLabel = UILabel()
    var itemChooseView = UIView()
        
    var categoryLabel = UILabel()
    var categoryButton = UIButton()
    var underLine2 = UILabel()
    //category button text should change depending on model
        
    var colorLabel = UILabel()
    var colorView = UIStackView()
    var underLine3 = UILabel()
    var colors_count = 5
    //color button color should change depending on model
        
    var tagLabel = UILabel()
    var tagField = UITextField()
    var underLine4 = UIImageView()
    var detailField = UITextField()
    var underLine5 = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationController?.isNavigationBarHidden = false
            self.navigationItem.backButtonTitle = ""
            
            self.view.backgroundColor = .clear
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
            configureOutfitTitleField()
            
            configureItemChooseLabel()
            configureItemChooseView()
            
            configureCategoryField()
            configureColorField()
            
            configureTagField()
            
            configureDetailField()
        }
        
        
        func configureOutfitTitleField(){
            titleLabel.text = "아이템명"
            titleLabel.textColor = .black
            titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            outfitTitleField.attributedPlaceholder = NSAttributedString(string: "Item100", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)])
            //TODO: this controller should get num of items and change placeholder.
            outfitTitleField.setLeftPaddingPoints(10)
            
            outfitTitleField.autocorrectionType = .no
            outfitTitleField.autocapitalizationType = .none
            outfitTitleField.layer.masksToBounds = true
            outfitTitleField.borderStyle = .none
            outfitTitleField.textColor = .black
            outfitTitleField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            outfitTitleField.translatesAutoresizingMaskIntoConstraints = false
            outfitTitleField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            outfitTitleField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
            outfitTitleField.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
            outfitTitleField.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48-titleLabel.frame.width).isActive = true
            
            underLine1.backgroundColor = .gray
            underLine1.translatesAutoresizingMaskIntoConstraints = false
            underLine1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine1.topAnchor.constraint(equalTo: self.outfitTitleField.bottomAnchor).isActive = true
            underLine1.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        

        func configureItemChooseLabel(){
            itemChooseLabel.text = "사진 선택"
            itemChooseLabel.textColor = .black
            itemChooseLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
           
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
            categoryLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            categoryLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
            categoryLabel.topAnchor.constraint(equalTo: self.itemChooseView.bottomAnchor, constant: 30).isActive = true
           
            let category_title = NSAttributedString(string: "아우터", attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 16.0, weight: .semibold)
            ])
            categoryButton.setAttributedTitle(category_title, for: .normal)
            
            self.categoryButton.showsMenuAsPrimaryAction = true
            categoryButton.menu = UIMenu(children: [
                UIAction(title: "아우터", handler: { action in
                    self.setAttributedTitle(title: "아우터")
                }),
                UIAction(title: "상의", handler: { action in
                    self.setAttributedTitle(title: "상의")
                }),
                UIAction(title: "하의", handler: { action in
                    self.setAttributedTitle(title: "하의")
                }),
                UIAction(title: "원피스", handler: { action in
                    self.setAttributedTitle(title: "원피스")
                }),
                UIAction(title: "기타", handler: { action in
                    self.setAttributedTitle(title: "기타")
                })
            ])
            
            categoryButton.layer.cornerRadius = 8
            categoryButton.layer.backgroundColor = UIColor.black.cgColor
            categoryButton.translatesAutoresizingMaskIntoConstraints = false
            categoryButton.leftAnchor.constraint(equalTo: self.categoryLabel.rightAnchor, constant: 10).isActive = true
            categoryButton.centerYAnchor.constraint(equalTo: self.categoryLabel.centerYAnchor).isActive = true
            categoryButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
            categoryButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
            categoryButton.clipsToBounds = true
            
            underLine2.backgroundColor = .clear
            underLine2.translatesAutoresizingMaskIntoConstraints = false
            underLine2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine2.topAnchor.constraint(equalTo: self.categoryButton.bottomAnchor, constant: 4).isActive = true
            underLine2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        
    
    func setAttributedTitle(title: String){
        let category_title = NSAttributedString(string: title, attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        ])
        self.categoryButton.setAttributedTitle(category_title, for: .normal)
    }
        
        func configureColorField(){
            //color label, buttons, and line
            //TODO: gets an array of colors from models
            colorLabel.text = "색상"
            colorLabel.textColor = .black
            colorLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            colorLabel.translatesAutoresizingMaskIntoConstraints = false
            colorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
            colorLabel.topAnchor.constraint(equalTo: self.underLine2.bottomAnchor, constant: 30).isActive = true
            
    
            let add_color = UIButton()
            colorView.addSubview(add_color)
            add_color.layer.backgroundColor = UIColor.white.cgColor
            //TODO: fix -- should add buttons not change the first button 
            add_color.layer.borderColor = UIColor.lightGray.cgColor
            add_color.layer.borderWidth = 1.0
            let plus = NSAttributedString(string: "+", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)])
            add_color.setAttributedTitle(plus, for: .normal)
            add_color.titleLabel?.textAlignment = .center
            add_color.layer.cornerRadius = 5
            add_color.translatesAutoresizingMaskIntoConstraints = false
            add_color.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor).isActive = true
            add_color.widthAnchor.constraint(equalToConstant: 25).isActive = true
            add_color.heightAnchor.constraint(equalToConstant: 25).isActive = true
            add_color.addTarget(self, action: #selector(showColorPicker), for: .touchUpInside)
            
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.axis = .horizontal
            colorView.distribution = .equalSpacing
            colorView.leadingAnchor.constraint(equalTo: self.categoryButton.leadingAnchor).isActive = true
            colorView.centerYAnchor.constraint(equalTo: self.colorLabel.centerYAnchor).isActive = true
            colorView.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(34*colors_count)).isActive = true
            colorView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            underLine3.backgroundColor = .clear
            underLine3.translatesAutoresizingMaskIntoConstraints = false
            underLine3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine3.topAnchor.constraint(equalTo: self.colorView.bottomAnchor, constant: 4).isActive = true
            underLine3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine3.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    
    
    
    @objc func showColorPicker(_ button : UIButton){
        //TODO: 색상 하나 선택하는거 치고 너무 과대한 거 아닐까?
        //그리고 나중에 색상별 검색을 도입하려면 많아지는건 오바임. 팔레트만 가능하게 하자. 언제 고치지...

        let picker = UIColorPickerViewController()
        picker.title = "아이템 색상"

        // Setting the Initial Color of the Picker
        picker.selectedColor = button.backgroundColor ?? .white

        // Setting Delegate
        picker.delegate = self

        // Presenting the Color Picker
        self.present(picker, animated: true, completion: nil)
    }
    
    
        
        func configureTagField(){
            //TODO: make the textfield parse the text with # or space
            tagLabel.text = "#태그"
            tagLabel.textColor = .black
            tagLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
            tagField.textColor = UIColor.systemGray
            tagField.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            
            underLine4.backgroundColor = .gray
            underLine4.translatesAutoresizingMaskIntoConstraints = false
            underLine4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine4.topAnchor.constraint(equalTo: self.tagField.bottomAnchor).isActive = true
            underLine4.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine4.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        
        func configureDetailField(){
            detailField.attributedPlaceholder = NSAttributedString(string: "정보 추가하기", attributes: [
               .foregroundColor: UIColor.systemGray,
               .font: UIFont.systemFont(ofSize: 16.0, weight: .semibold)
               //.font: UIFont.boldSystemFont(ofSize: 16.0)
           ])
           
            //detailField.setLeftPaddingPoints(10)
            detailField.autocorrectionType = .no
            detailField.autocapitalizationType = .none
            detailField.borderStyle = .none
            detailField.textColor = .black
            detailField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            detailField.translatesAutoresizingMaskIntoConstraints = false
            detailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            detailField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            detailField.topAnchor.constraint(equalTo: self.tagField.bottomAnchor, constant: 10).isActive = true
            detailField.widthAnchor.constraint(equalTo:self.view.widthAnchor, constant: -48).isActive = true
            
            underLine5.backgroundColor = .gray
            underLine5.translatesAutoresizingMaskIntoConstraints = false
            underLine5.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine5.topAnchor.constraint(equalTo: self.detailField.bottomAnchor).isActive = true
            underLine5.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine5.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.tagField {
            
        }
    }
    

}

extension AddItemViewController: UIColorPickerViewControllerDelegate {
    
    //  Called once you have finished picking the color.
        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            let add_color = UIButton()
            self.colorView.addSubview(add_color)
            add_color.layer.backgroundColor = viewController.selectedColor.cgColor
            add_color.titleLabel?.textAlignment = .center
            add_color.layer.cornerRadius = 5
            add_color.translatesAutoresizingMaskIntoConstraints = false
            add_color.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor).isActive = true
            add_color.widthAnchor.constraint(equalToConstant: 25).isActive = true
            add_color.heightAnchor.constraint(equalToConstant: 25).isActive = true
            add_color.addTarget(self, action: #selector(showColorPicker), for: .touchUpInside)
            //TODO: should add another button into the stack
            
        }
        
        //  Called on every color selection done in the picker.
        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            //self.colorLabel.backgroundColor = viewController.selectedColor
        }
}
