//
//  ItemsViewController.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/12.
//

import UIKit

class ItemsViewController: UIViewController {
    
    //var categoryPicker = UIScrollView()
    var stack = UIStackView()
    //TODO: var categoryPicker = UICollectionView() or scroll view?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        configureSubViews()

        
    }
    
    func addSubviews(){
        self.view.addSubview(stack)
        
    }
    
    func configureSubViews(){
        configureNavController()
        configureCategoryStack()
    }
    
    func configureNavController(){
        let titleLogo = UILabel()
        titleLogo.text = "CLOCHE"
        titleLogo.font = UIFont(name: "UNDERRATED", size: 22)
        titleLogo.textColor = .black
        let LeftButton = UIBarButtonItem(customView: titleLogo)
        self.navigationItem.setLeftBarButton(LeftButton, animated: true)
        
        
        let searchButton = UIButton()
        let plusButton = UIButton()
        //let editButton = UIButton()
        //TODO: change button sizes

        searchButton.setImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        plusButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        plusButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        searchButton.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        //editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        //editButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let searchBar = UIBarButtonItem(customView: searchButton)
        let plusBar = UIBarButtonItem(customView: plusButton)
        //let editBar = UIBarButtonItem(customView: editButton)
        self.navigationItem.setRightBarButtonItems([searchBar, plusBar], animated: true)
    }
    
    @objc func didTapAdd(){
        let VC = AddItemViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func configureCategoryStack(){
        var categories : [Category] = []
        let all = Category(name: "전체", mainImage: UIImage(named: "small_logo") ?? UIImage())
        let tops = Category(name: "상의", mainImage: UIImage(named: "top0") ?? UIImage())
        let bottom = Category(name: "하의", mainImage: UIImage(named: "bottom0") ?? UIImage())
        let outers = Category(name: "아우터", mainImage: UIImage(named: "outwear0") ?? UIImage())
        let dress = Category(name: "원피스", mainImage: UIImage(named: "bottom3") ?? UIImage())
        let shoes = Category(name: "신발", mainImage: UIImage(named: "shoes0") ?? UIImage())
        let extra = Category(name: "기타", mainImage: UIImage(named: "bag0") ?? UIImage())
        
        categories.append(all)
        categories.append(tops)
        categories.append(bottom)
        categories.append(outers)
        categories.append(dress)
        categories.append(shoes)
        categories.append(extra)
        
       //categoryPicker.addSubview(stack)
        
        for category in categories{
            let button = UIButton()
            if (category.name == "전체"){
                //TODO: first button should be touched first
                //button.isEnabled = true
            }
            stack.addArrangedSubview(button)
            //categoryPicker.addArrangedSubview(button)
            button.setImage(category.image, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 70).isActive = true
            button.heightAnchor.constraint(equalToConstant: 70).isActive = true
            button.layer.cornerRadius = 20
            button.layer.borderColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0).cgColor
            button.layer.borderWidth = 0.5
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(didChangeCategory), for: .touchUpInside)
        }
        
        
        stack.axis = .horizontal
        stack.clipsToBounds = true
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        //how to make category picker scroll?
    }
    
    @objc func didChangeCategory(){
        //get category name and reload data according to it
    }
    
    func configureCollectionView(){
        
    }
    
}

class Category{
    var name : String
    var count = 0
    var image : UIImage
    
    init(name: String, mainImage: UIImage){
        self.name = name
        self.image = mainImage
    }
}
