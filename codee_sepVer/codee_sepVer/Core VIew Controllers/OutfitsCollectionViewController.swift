//
//  OutfitsViewController.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/12.
//

import UIKit

/*
class OutfitsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    private var outfitList = [Outfit](){
        didSet {
            self.saveOutfitList()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
        //return self.outfitList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutfitsCollectionViewCell", for: indexPath) as! OutfitsCollectionViewCell
        let outfit = self.outfitList[indexPath.row]
        cell.mainImage.image = UIImage(named: "OutfitSample")
        cell.liked = outfit.isLiked
        cell.backgroundColor = UIColor(named: "red")
        return cell
        }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            //cellsize
            return CGSize(width: (UIScreen.main.bounds.width / 2) - 40, height: 200)
        }
    
    
    
    var sortingButton = UIButton()
    var totalOutfitsNum = UILabel()
    var infoBar = UIStackView()
    var outfitsCollection : UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(infoBar)
        
        
        configureNavigationBar()
        configureInfoBar()
        configureCollectionView()
    }
    
    
    private func configureNavigationBar(){
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapAddOutfit))
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(didTapSearch))
        
        let editButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapEdit))
        
        let navLabel = UILabel()
        navLabel.text = "My Outfits"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: navLabel)
       
        self.navigationItem.rightBarButtonItems = [editButton, searchButton,addButton]
    }
    
    private func configureInfoLabel(){
        let totalOutfits = 100
        //self.outfitList.count
        self.totalOutfitsNum.text = "전체 \(totalOutfits)개"
        self.totalOutfitsNum.textColor = .systemGray
        self.totalOutfitsNum.sizeToFit()
        self.totalOutfitsNum.translatesAutoresizingMaskIntoConstraints = false
        self.totalOutfitsNum.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.totalOutfitsNum.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33).isActive = true
        self.totalOutfitsNum.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.sortingButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureSettingsButton(){
        sortingButton.setTitle("최신순", for: .normal)
        sortingButton.setTitleColor(.systemGray, for: .normal)
        let recent = UIAction(title: "최신순", state: .on, handler: { _ in print("최신순") })
        let oldest = UIAction(title: "오래된 순", attributes: .destructive, state: .on, handler: { _ in print("오래된 순") })
        let mostWorn = UIAction(title: "많이 입은 순", attributes: .destructive, state: .on, handler: { _ in print("많이 입은 순") })
        let leastWorn = UIAction(title: "적게 입은 순", attributes: .destructive, state: .on, handler: { _ in print("적게 입은 순") })
        
        let buttonMenu = UIMenu(title: "메뉴 타이틀", children: [recent, oldest, mostWorn, leastWorn])
        self.sortingButton.menu = buttonMenu
        
        self.sortingButton.titleLabel?.textAlignment = .center
        self.sortingButton.layer.masksToBounds = true
        self.sortingButton.translatesAutoresizingMaskIntoConstraints = false
        self.sortingButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.sortingButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 323).isActive = true
        self.sortingButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.sortingButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureInfoBar(){
        infoBar.addArrangedSubview(totalOutfitsNum)
        infoBar.addArrangedSubview(sortingButton)
        
        configureInfoLabel()
        configureSettingsButton()
        
        infoBar.axis = .horizontal
        infoBar.distribution = .fillProportionally
        infoBar.spacing = 190
        infoBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        infoBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        infoBar.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        infoBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func configureCollectionView(){
        self.outfitsCollection?.collectionViewLayout = UICollectionViewFlowLayout()
        self.outfitsCollection?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.outfitsCollection?.delegate = self
        self.outfitsCollection?.dataSource = self
        
        guard let outfitsCollection = outfitsCollection else {
            return
        }
        
        view.addSubview(outfitsCollection)
        
        //cell register
        self.outfitsCollection?.register(OutfitsCollectionViewCell.self, forCellWithReuseIdentifier: OutfitsCollectionViewCell.identifier)
        self.outfitsCollection?.translatesAutoresizingMaskIntoConstraints = false
        self.outfitsCollection?.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.outfitsCollection?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.outfitsCollection?.topAnchor.constraint(equalTo: self.infoBar.bottomAnchor, constant: 30).isActive = true
    }
    
   private func saveOutfitList(){
        let data = self.outfitList.map{
            [
                "uuidString" : $0.uuidString,
                "outfitName" : $0.outfitName,
                "isLiked" : $0.isLiked]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "outfitList")
    }
    
    private func loadOutfitList(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "outfitList") as? [[String: Any]] else {return}
        self.outfitList = data.compactMap {
            guard let uuidString = $0["uuidString"] as? String else { return nil}
            guard let outfitName = $0["outfitName"] as? String else { return nil }
            guard let isLiked = $0["isLiked"] as? Bool else { return nil }
            guard let tags = $0["tags"] as? String else {return nil}
            guard let details = $0["details"] as? String else {return nil}
            guard let savedDate = $0["date"] as? Date else {return nil}
            return Outfit(
                uuidString: uuidString,
                outfitName: outfitName,
                tags: tags,
                details: details,
                isLiked: isLiked,
                savedDate: savedDate)
        }
        
        self.outfitList = self.outfitList.sorted(by: {
            $0.savedDate.compare($1.savedDate) == .orderedDescending
        })
    }
    
    @objc func didTapAddOutfit(){
        
    }
    
    @objc func didTapSearch(){
        
    }
    
    @objc func didTapEdit(){
        
    }
     
}
*/
