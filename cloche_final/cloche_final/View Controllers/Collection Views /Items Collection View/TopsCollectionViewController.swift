//
//  TopsCollectionViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit
import RxSwift


class TopsCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout {
   
    private let bag = DisposeBag()
    
    var topListView : UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      // Register cell classes
       
        topListView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(topListView)
        self.configureTopList()
        self.topListView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        self.bind()
    }
    
    func configureTopList(){
        self.layout.scrollDirection = .vertical
        self.topListView.setCollectionViewLayout(layout, animated: true)
        self.topListView.showsVerticalScrollIndicator = false
        self.topListView.backgroundColor = .clear
        self.topListView.translatesAutoresizingMaskIntoConstraints = false
        self.topListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.topListView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.topListView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.topListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func bind(){
        self.topListView.register(FilterListCollectionViewCell.self, forCellWithReuseIdentifier: "FilterListCollectionViewCell")
        
        self.topListView.rx.setDelegate(self)
            .disposed(by: bag)
        
        let itemObservable = Observable.of(TotalItemsState.shared.totalItems)
        //let itemObservable = Observable.of(self.sampleItemList)
        itemObservable
            .observe(on: MainScheduler.instance)
            .bind(to: self.topListView.rx.items(cellIdentifier: "FilterListCollectionViewCell", cellType: FilterListCollectionViewCell.self))
        {
            _, Item, cell in
        
            //bag0 --> give a default top image
            cell.configureDesign(imageName: Item.imagePath ?? "bag0", liked: Item.liked, item: Item)
            cell.layer.cornerRadius = 10
            
        }
        .disposed(by: bag)
        
        self.topListView.rx.modelSelected(Item.self)
                   .subscribe(onNext: { item in
                   let VC = ItemDetailViewController(item: item)
                   self.navigationController?.pushViewController(VC, animated: true)
                   })
                   .disposed(by: bag)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-24)/3,  height: 125)
    }
    
    let sampleItemList =
        [
            Item(id: 1, imagePath: "top0", name: "팔로마울 매쉬 긴팔 탑", category: "top", color: UIColor.blue, tags: ["#가을", "#팔로마울", "#메쉬", "#유니크"], details: "사이즈 M임. 아 왜 사이즈 넣을 생각 안했지?", liked: false),
            Item(id: 2, imagePath: "top1", name: "반팔", category: "top", color: UIColor.gray, tags: ["#유니크"], details: nil, liked: false),
            Item(id: 3, imagePath: "top2", name: "나시", category: "top", color: UIColor.yellow, tags: ["#여름"], details: "2번 입은 듯", liked: false)
        ]

}
