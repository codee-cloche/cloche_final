//
//  ItemsCollectionView.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/20.
//

import UIKit

class ItemsCollectionView: UIView {
    
    var sortingButton = UIButton()
    var numLabel = UILabel()
    var itemsButtonCollection = UIView()
    //shouod be collection view
    var category : Category
    

    init(category: Category, width: CGFloat, height: CGFloat) {
        self.category = category
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        self.addSubview(sortingButton)
        self.addSubview(numLabel)
        self.addSubview(itemsButtonCollection)
    }
    
    func configureSubViews(){
        let count = category.count
        numLabel.text = "총 \(count)개"
        numLabel.textColor = .black
        numLabel.font = UIFont(name: "AppleSDGothicNeo", size: 14)
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        numLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        
        sortingButton.showsMenuAsPrimaryAction = true
        let recent = UIAction(title: "최신순", image: nil)
        let most_worn = UIAction(title: "많이 입은 순", image: nil , identifier: nil, discoverabilityTitle: nil, attributes: nil, state: .on, handler: <#T##UIActionHandler##UIActionHandler##(UIAction) -> Void#>)
        let least_worn = UIAction(title: "덜 입은 순", image: <#T##UIImage?#>, identifier: <#T##UIAction.Identifier?#>, discoverabilityTitle: <#T##String?#>, attributes: <#T##UIMenuElement.Attributes#>, state: <#T##UIMenuElement.State#>, handler: <#T##UIActionHandler##UIActionHandler##(UIAction) -> Void#>)
        sortingButton.menu = UIMenu(title: "", children: [recent, most_worn, least_worn])
        sortingButton.translatesAutoresizingMaskIntoConstraints = false
        sortingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        sortingButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
    
        
        
    }
    
    
    
    

}

