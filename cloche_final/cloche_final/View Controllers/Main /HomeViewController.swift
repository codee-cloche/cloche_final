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
        NotificationCenter.default.addObserver(self, selector: #selector(didTapAddItem), name: NSNotification.Name("addItem"), object: nil)
        
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
    
    @objc func didTapAddItem(){
        let VC = AddItemViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func configureHeaders(){
        self.logoTitle.text = "CLOCHE"
        self.logoTitle.textColor = .black
        self.logoTitle.font = UIFont(name: "UNDERRATED", size: 22)
        self.logoTitle.translatesAutoresizingMaskIntoConstraints = false
        self.logoTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.logoTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        
    }
    
    func configureSearchBar(){
        
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12).isActive = true
        self.searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12).isActive = true
        self.searchBar.topAnchor.constraint(equalTo: self.logoTitle.bottomAnchor, constant: 15).isActive = true
        self.searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.searchBar.layer.cornerRadius = 15
        self.searchBar.clipsToBounds = true

        let emptyImage = UIImage()
        self.searchBar.setImage(emptyImage, for: .search, state: .normal)
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "???? ??????, ?????????, ???????????? ??????????????????! ????", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)])
        self.searchBar.searchTextField.textColor = .black
        self.searchBar.layer.borderColor = UIColor.clear.cgColor
        self.searchBar.tintColor = .clear
        
        self.searchBar.searchTextField.font = UIFont.systemFont(ofSize: 14, weight: .light)
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
            if (designString[1] == "??????"){
                //????????? ???????????? ?????????. 
                self.filterCollectionView.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .top)
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
        filterCollectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor).isActive = true
        filterCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        filterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func configureListCollectionView(){
        self.dividerBottom.translatesAutoresizingMaskIntoConstraints = false
        self.dividerBottom.backgroundColor = .lightGray.withAlphaComponent(0.5)
        self.dividerBottom.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.dividerBottom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.dividerBottom.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.dividerBottom.heightAnchor.constraint(equalToConstant: 4).isActive = true
        self.dividerBottom.topAnchor.constraint(equalTo: self.filterCollectionView.bottomAnchor, constant: 6).isActive = true
        
        self.topsCollectionView.view.frame = CGRect(x: 24, y: 260, width: self.view.frame.width-48, height: self.view.frame.height)
    }
    
    func configureTopCollectionView(){
        
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    
let categories =
    [
        
    //total of 5 categories
     ["top0","??????"],
     ["top1", "??????"],
     ["bottom0", "??????"],
     ["outwear1", "?????????"],
     ["dress0", "?????????"],
     ["shoes1", "??????"],
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

