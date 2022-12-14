//
//  EditItemViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/12.
//

import UIKit

class EditItemViewController: UIViewController {

    var my_item : Item
    
    var titleLabel = UILabel()
    var outfitTitleField = UITextField()
    var underLine1 = UILabel()
        
    var itemChooseLabel = UILabel()
    //var itemChooseView = UICollectionView()
    var itemChooseView = UIView()
        
    var categoryLabel = UILabel()
    var categoryButton = UIButton()
    var underLine2 = UILabel()
    //category button text should change depending on model
        
    var colorLabel = UILabel()
    var colorView = UIStackView()
    var underLine3 = UILabel()
    //color button color should change depending on model
        
    var tagLabel = UILabel()
    var tagField = UITextField()
    var underLine4 = UIImageView()
    var detailField = UITextField()
    var underLine5 = UILabel()
    
    
    init(item: Item){
        
        self.my_item = item
        self.outfitTitleField.text = item.name
        self.categoryButton.setTitle(item.category, for: .normal)
        var tagString = ""
        for tag in item.tags ?? [] {
            tagString = tagString + tag + " "
        }
        self.tagField.text = tagString
        self.detailField.text = item.details
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.title = "아이템 수정"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(saveItem)
        )
        
        self.view.backgroundColor = .white
        addSubviews()
        configureSubViews()
        }
    
    @objc func saveItem(){
        //fields to change --> 일단은 textfields..생각해보니까 photo 는 UIImage 형태로 주고 받아야할듯싶다.
        //이거 관리하는 database 어떻게 만들지?
        self.navigationController?.popViewController(animated: true)
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
            titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            outfitTitleField.setLeftPaddingPoints(10)
            
            outfitTitleField.autocorrectionType = .no
            outfitTitleField.autocapitalizationType = .none
            outfitTitleField.layer.masksToBounds = true
            outfitTitleField.borderStyle = .none
            outfitTitleField.textColor = .black
            outfitTitleField.font = UIFont.systemFont(ofSize: 14, weight: .light)
            
            outfitTitleField.translatesAutoresizingMaskIntoConstraints = false
            outfitTitleField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            outfitTitleField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
            outfitTitleField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
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
            itemChooseLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
           
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
            categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            categoryLabel.translatesAutoresizingMaskIntoConstraints = false
            categoryLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive  = true
            categoryLabel.topAnchor.constraint(equalTo: self.itemChooseView.bottomAnchor, constant: 30).isActive = true
            
            //categoryButton.setTitle("아우터", for: .normal)
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
            
            underLine2.backgroundColor = .clear
            underLine2.translatesAutoresizingMaskIntoConstraints = false
            underLine2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine2.topAnchor.constraint(equalTo: self.categoryButton.bottomAnchor, constant: 4).isActive = true
            underLine2.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        
        @objc func didTapChangeCategory(){
            
        }
        
        func configureColorField(){
            //color label, buttons, and line
            //TODO: gets an array of colors from models
            colorLabel.text = "색상"
            colorLabel.textColor = .black
            colorLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
                color_button.addTarget(self, action: #selector(showColorPicker), for: .touchUpInside)
                //colorButtons.append(color_button)
            }
            
            colorView.translatesAutoresizingMaskIntoConstraints = false
            colorView.axis = .horizontal
            colorView.distribution = .equalSpacing
            colorView.leadingAnchor.constraint(equalTo: self.colorLabel.trailingAnchor, constant: 10).isActive = true
            colorView.centerYAnchor.constraint(equalTo: self.colorLabel.centerYAnchor).isActive = true
            colorView.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(34*colors.count)).isActive = true
            colorView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            underLine3.backgroundColor = .clear
            underLine3.translatesAutoresizingMaskIntoConstraints = false
            underLine3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine3.topAnchor.constraint(equalTo: self.colorView.bottomAnchor, constant: 4).isActive = true
            underLine3.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine3.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
    
    @objc func showColorPicker(){
        //TODO: 색상 하나 선택하는거 치고 너무 과대한 거 아닐까?
        //그리고 나중에 색상별 검색을 도입하려면 많아지는건 오바임. 팔레트만 가능하게 하자.
        let picker = UIColorPickerViewController()
        picker.title = "아이템 색상"

        // Setting the Initial Color of the Picker
        //change blue to color
        picker.selectedColor = .blue

        // Setting Delegate
        picker.delegate = self

        // Presenting the Color Picker
        self.present(picker, animated: true, completion: nil)
    }
        
        func configureTagField(){
            //TODO: make the textfield parse the text with # or space
            tagLabel.text = "#태그"
            tagLabel.textColor = .black
            tagLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
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
            tagField.font = UIFont.systemFont(ofSize: 14, weight: .light)
            
            underLine4.backgroundColor = .gray
            underLine4.translatesAutoresizingMaskIntoConstraints = false
            underLine4.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine4.topAnchor.constraint(equalTo: self.tagField.bottomAnchor).isActive = true
            underLine4.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine4.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        
        func configureDetailField(){
            detailField.font = UIFont.systemFont(ofSize: 14, weight: .light)
           
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
            
            underLine5.backgroundColor = .gray
            underLine5.translatesAutoresizingMaskIntoConstraints = false
            underLine5.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
            underLine5.topAnchor.constraint(equalTo: self.detailField.bottomAnchor).isActive = true
            underLine5.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -48).isActive = true
            underLine5.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
}

extension EditItemViewController : UIColorPickerViewControllerDelegate {
    //  Called once you have finished picking the color.
        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            //self.colorLabel.backgroundColor = viewController.selectedColor
        }
        
        //  Called on every color selection done in the picker.
        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            //self.colorLabel.backgroundColor = viewController.selectedColor
        }
}
