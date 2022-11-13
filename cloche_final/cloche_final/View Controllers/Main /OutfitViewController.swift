//
//  OutfitViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

class OutfitViewController: UIViewController {

    private let item: CustomTabItem
    
    var titleLabel = UILabel()
    var searchBar = UISearchBar()
    var filterButton = UIButton()
    var topsCollectionView = TopsCollectionViewController()
    let vertical_layout = UICollectionViewFlowLayout()
    
    
    init(item: CustomTabItem) {
                self.item = item
                super.init(nibName: nil, bundle: nil)
            }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(searchBar)
       
        self.add(topsCollectionView)
        
        configureHeaders()
        configureSearchBar()
        configureListCollectionView()

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapAddItem(){
        let VC = AddItemViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func configureHeaders(){
        self.titleLabel.text = "Outfits"
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        
    }
    
    func configureSearchBar(){
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "👚 색상, 브랜드, 키워드를 검색해보세요! 👚", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)])
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        self.searchBar.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15).isActive = true
        self.searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.searchBar.clipsToBounds = true
        //self.searchBar.setupCornerRadius(10, maskedCorners: .layerMaxXMaxYCorner)
        self.searchBar.layer.borderColor = UIColor.clear.cgColor
        let emptyImage = UIImage()
        self.searchBar.setImage(emptyImage, for: .search, state: .normal)
        self.searchBar.backgroundColor = .clear
        self.searchBar.searchTextField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        self.searchBar.searchTextField.layer.cornerRadius = 10
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.layer.borderWidth = 0
        self.searchBar.layer.borderColor = UIColor.clear.cgColor
        //TODO: 죽어도 사라지지 않는 경계선
        self.searchBar.searchTextField.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    func configureListCollectionView(){
        self.topsCollectionView.view.frame = CGRect(x: 24, y: 170, width: self.view.frame.width-48, height: self.view.frame.height)
    }
    


}
