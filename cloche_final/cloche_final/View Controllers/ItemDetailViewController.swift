//
//  ItemDetailViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/02.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var my_item : Item
    
    var image = UIImageView()
    
    var titleLabel = UILabel()
    
    var categoryLabel = UILabel()
    
    var colorTitleLabel = UILabel()
    var colorLabel = UILabel()
    
    var tagLabel : [UILabel] = []
    var tagStackView = UIStackView()
    
    var detailLabel = UILabel()
    
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
        //add menu to editRightButton
        self.navigationItem.setRightBarButtonItems([editRightButton , exportRightButton], animated: true)
        self.view.backgroundColor = .white
        addSubviews()
        configureDesign()
    }
    
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func addSubviews(){
        self.view.addSubview(image)
        self.view.addSubview(titleLabel)
        self.view.addSubview(detailLabel)
        self.view.addSubview(colorLabel)
        self.view.addSubview(colorTitleLabel)
        self.view.addSubview(tagStackView)
    }
    
    func configureDesign(){
        configureImage()
        configureTagStack()
        configureLabels()
        
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
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabels(){
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 20).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        self.detailLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.detailLabel.topAnchor.constraint(equalTo: self.tagStackView.bottomAnchor, constant: 15).isActive = true
        
        self.colorTitleLabel.text = "색상"
        self.colorTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.colorTitleLabel.topAnchor.constraint(equalTo: self.detailLabel.bottomAnchor, constant: 10).isActive = true
        self.colorTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.colorTitleLabel.textColor = .black
        
        self.colorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.colorLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.colorLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        self.colorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
    
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
        self.tagStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        self.tagStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func configureImage(){
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.image.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.image.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.image.contentMode = .scaleToFill
        self.image.layer.cornerRadius = 0
    }
}
