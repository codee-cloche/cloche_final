//
//  HomeViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    
    private let item: CustomTabItem
    private let bag = DisposeBag()
    
    //MARK: collection view for filtering the outfits
    var filterCollectionView: UICollectionView!
    
    //MARK: collection views for the outfits
    //var allItemsCollectionView = allItemsCollectionViewController()
   // var outerCollectionView = OuterCollectionViewController()
    var topsCollectionView = TopsCollectionViewController()
    //var bottomsCollectionView = BottomsCollectionViewController()
    //var dressCollectionView = DressCollectionViewController()
    //var shoesCollectionView = ShoesCollectionViewController()
    //var accessoriesCollecionView = AccessoriesCollectionViewController()
    
    //MARK: layoouts for the collection views
    let layout = UICollectionViewFlowLayout()
    let vertical_layout = UICollectionViewFlowLayout()
    
    //MARK: other design properties
    private var logoTitle = UILabel()
    private var searchBar = UISearchBar()
    private var dividerBottom = UILabel()
    
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
        self.view.addSubview(logoTitle)
        self.view.addSubview(searchBar)
        self.view.addSubview(dividerBottom)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.filterCollectionView.register(ItemListCollectionViewCell.self, forCellWithReuseIdentifier: "ItemListCollectionViewCell")
        self.view.addSubview(filterCollectionView)
        self.add(topsCollectionView)
        self.bindFilters()
        configureHeaders()
        configureSearchBar()
        configureFilterCollectionView()
        configureListCollectionView()
       
    }
    
    func configureHeaders(){
        self.logoTitle.text = "CLOCHE"
        self.logoTitle.textColor = .black
        self.logoTitle.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logoTitle.translatesAutoresizingMaskIntoConstraints = false
        self.logoTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.logoTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        
    }
    
    func configureSearchBar(){
        self.searchBar.placeholder = "색상, 브랜드, 검색하고 싶은 옷의 종류를 검색해보세요!"
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        self.searchBar.topAnchor.constraint(equalTo: self.logoTitle.bottomAnchor, constant: 20).isActive = true
        self.searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.searchBar.clipsToBounds = true
        self.searchBar.setupCornerRadius(10, maskedCorners: .layerMaxXMaxYCorner)
        self.searchBar.layer.borderColor = UIColor.clear.cgColor
        self.searchBar.backgroundColor = .gray
        
    }
    
    func bindFilters(){
        filterCollectionView.rx.setDelegate(self)
            .disposed(by: bag)
        
        let filterObservable = Observable.of(self.categories)
        
        filterObservable
            .observe(on: MainScheduler.instance)
            .bind(to: filterCollectionView.rx.items(cellIdentifier: "ItemListCollectionViewCell", cellType: ItemListCollectionViewCell.self))
        { index, designString, cell in
            cell.configureDesign(imageName: designString[0], title: designString[1])
            cell.layer.cornerRadius = 20
            if (designString[1] == "전체"){
                cell.isSelected = true
            }
        }
        .disposed(by: bag)
        
        filterCollectionView.rx.itemSelected
            .subscribe(onNext: { index in
                //reload data here
            })
    }
    
    
    
    func configureFilterCollectionView(){
        layout.scrollDirection = .horizontal
        filterCollectionView.setCollectionViewLayout(self.layout, animated: true)
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.backgroundColor = .clear
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 10).isActive = true
        filterCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        //TODO: 아마 insets 안될거임.
    }
    
    func configureListCollectionView(){
        self.dividerBottom.translatesAutoresizingMaskIntoConstraints = false
        self.dividerBottom.backgroundColor = .black
        self.dividerBottom.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.dividerBottom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.dividerBottom.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.dividerBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.dividerBottom.topAnchor.constraint(equalTo: self.filterCollectionView.bottomAnchor).isActive = true
        
        self.topsCollectionView.view.frame = CGRect(x: 24, y: 300, width: self.view.frame.width-48, height: self.view.frame.height)
    }
    
    func configureTopCollectionView(){
        
    }
    
    
    
let categories =
    [
    //image set name + TEXT TO show
    //total of 6 categories
     ["top0","전체"],
     ["top1", "상의"],
     ["bottom0", "하의"],
     ["outwear1", "아우터"],
     ["bottom1", "원피스"],
     ["shoes1", "신발"],
     ["bag0", "악세서리"]
     
    ]


}

public extension UIViewController {

    /// Adds child view controller to the parent.
    /// - Parameter child: Child view controller.
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    /// It removes the child view controller from the parent.
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

