//
//  ItemDetailViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/02.
//

import UIKit
import RxSwift

class ItemDetailViewController: UIViewController {

    var my_item : Item
    
    var image = UIImageView()
    
    var titleLabel = UILabel()
    
    var categoryTitleLabel = UILabel()
    var categoryLabel = UILabel()
    
    var colorTitleLabel = UILabel()
    var colorLabel = UILabel()
    
    var tagLabel : [UILabel] = []
    var tagStackView = UIStackView()
    
    var dividerLabel = UILabel()
    
    var detailLabel = UILabel()
    
    var tabBar = UIStackView()
    var likeButton = UIButton()
    var wearButton = UIButton()
    var usetoOutfitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIButton()
        self.navigationItem.hidesBackButton = true
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: true)
        
        let editButton = UIButton()
        let exportButton = UIButton()
        let threeDots = UIImage(systemName: "ellipsis")
        editButton.setImage(threeDots, for: .normal)
        editButton.tintColor = .black
        exportButton.tintColor = .black
        exportButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        let editRightButton = UIBarButtonItem(customView: editButton)
        let exportRightButton = UIBarButtonItem(customView: exportButton)
        //editButton.showsMenuAsPrimaryAction = true
        /*editButton.menu = UIMenu(children: [
            UIAction(title: "수정", handler: { action in
                print("edit")
            }),
            UIAction(title: "삭제", handler: { action in
                print("delete")
            })
        ])*/
        editButton.addTarget(self, action: #selector(displayActionSheet(_:)), for: .touchUpInside)
        //change to ui alert controller in swift 
        self.navigationItem.setRightBarButtonItems([editRightButton , exportRightButton], animated: true)
        self.view.backgroundColor = .white
        addSubviews()
        configureDesign()
    }
    
    @objc func displayActionSheet(_ sender: Any) {
         
        // 1
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
        // 2
        //let editAction = UIAlertAction(title: "아이템 수정", style: .default)
        let editAction = UIAlertAction(title: "아이템 수정", style: .default, handler: { (UIAlertAction) in
            let VC = EditItemViewController(item: self.my_item)
            self.navigationController?.pushViewController(VC, animated: true)
        })
       
        let deleteAction = UIAlertAction(title: "삭제", style: .default)
        deleteAction.setValue(UIColor.red, forKey: "titleTextColor")
            
        // 3
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            
        // 4
        optionMenu.addAction(editAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
            
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func addSubviews(){
        self.view.addSubview(image)
        self.view.addSubview(titleLabel)
        self.view.addSubview(tagStackView)
        self.view.addSubview(detailLabel)
        self.view.addSubview(colorLabel)
        self.view.addSubview(colorTitleLabel)
        self.view.addSubviews(categoryLabel)
        self.view.addSubviews(categoryTitleLabel)
        self.view.addSubview(dividerLabel)
         self.view.addSubview(tabBar)
    }
    
    func configureDesign(){
        configureImage()
        configureTitleLabel()
        configureTagStack()
        configureDetailLabel()
        configureLabels()
        configureTabBar()
        
    }
    
    init(item: Item){
        self.my_item = item
        self.image.image = UIImage(named: item.imagePath ?? "nothing")
        self.titleLabel.text = item.name
        self.categoryLabel.text = item.category
        self.colorLabel.backgroundColor = item.color
        for tags in item.tags ?? []{
            let button = UILabel()
            button.text = "    " + tags + "    "
            self.tagLabel.append(button)
        }
        self.detailLabel.text = item.details
        self.likeButton.isSelected = item.liked
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(){
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.image.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.image.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        //정사각형 크기
        self.image.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.image.contentMode = .scaleToFill
        self.image.layer.cornerRadius = 0
    }
    
    func configureTitleLabel(){
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 20).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.titleLabel.textColor = .black
    }
    
    func configureLabels(){
        self.colorTitleLabel.text = "색상"
        self.colorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.colorTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.colorTitleLabel.topAnchor.constraint(equalTo: self.dividerLabel.bottomAnchor, constant: 20).isActive = true
        self.colorTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.colorTitleLabel.textColor = .black
        
        
        self.colorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.colorLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.colorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.colorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        self.colorLabel.topAnchor.constraint(equalTo: self.colorTitleLabel.topAnchor).isActive = true
        self.colorLabel.layer.cornerRadius = 5
        
        
        
        self.categoryTitleLabel.text = "카테고리"
        self.categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.categoryTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive
         = true
        self.categoryTitleLabel.topAnchor.constraint(equalTo: self.colorTitleLabel.bottomAnchor, constant: 15).isActive = true
        self.categoryTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        self.categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.categoryLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        self.categoryLabel.topAnchor.constraint(equalTo: self.categoryTitleLabel.topAnchor).isActive  = true
        self.categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
    }
    

    func configureDetailLabel(){
        self.detailLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.detailLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15).isActive = true
        self.dividerLabel.backgroundColor = .lightGray.withAlphaComponent(0.5)
        self.dividerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dividerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.dividerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.dividerLabel.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        self.dividerLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10).isActive = true
        
    }
    

    
    func configureTagStack(){
        self.tagStackView.axis = .horizontal
        for tag in self.tagLabel {
            tag.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            tag.layer.borderColor = UIColor.lightGray.cgColor
            tag.textColor = UIColor.darkGray
            tag.layer.borderWidth = 0.1
            tag.layer.cornerRadius = 5
        }
        
        self.tagStackView.addArrangedSubviews(self.tagLabel)
        self.tagStackView.spacing = 10
        self.tagStackView.translatesAutoresizingMaskIntoConstraints = false
        self.tagStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.tagStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        self.tagStackView.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
    
    
    func configureTabBar(){
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.tabBar.layer.addSublayer(topBorder)
        
        self.tabBar.axis = .horizontal
        self.tabBar.spacing = 10
       
        
        self.tabBar.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(120)
        }
    
        
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        likeButton.clipsToBounds = true
        
        
        let titleString = NSAttributedString(string: "조합으로 만들기", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        usetoOutfitButton.setAttributedTitle(titleString, for: .normal)
        usetoOutfitButton.backgroundColor = .lightGray
        usetoOutfitButton.translatesAutoresizingMaskIntoConstraints = false
        usetoOutfitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usetoOutfitButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        usetoOutfitButton.layer.cornerRadius = 10
        usetoOutfitButton.clipsToBounds = true
        
        let titleString2 = NSAttributedString(string: "입기", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        wearButton.setAttributedTitle(titleString2, for: .normal)
        wearButton.backgroundColor = .black
        wearButton.setTitleColor(.white, for: .normal)
        wearButton.translatesAutoresizingMaskIntoConstraints = false
        wearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        wearButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        wearButton.layer.cornerRadius = 10
        wearButton.clipsToBounds = true
        
        self.tabBar.isLayoutMarginsRelativeArrangement = true
        self.tabBar.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        self.tabBar.addArrangedSubviews([likeButton, usetoOutfitButton, wearButton])
        self.tabBar.alignment = .center
        
       
        
        
    }
}
