//
//  CustomItemView.swift
//  CustomTabBarExample
//
//  Created by Jędrzej Chołuj on 18/12/2021.
//
import UIKit
import SnapKit

final class CustomItemView: UIView {
    
    
    private let iconImageView = UIImageView()
    private let containerView = UIView()
    private let nameLabel = UILabel()
    let index: Int
    
    var isSelected = false {
        didSet {
            animateItems()
        }
    }
    
    private let item: CustomTabItem
    
    init(with item: CustomTabItem, index: Int) {
        self.item = item
        self.index = index
        
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(iconImageView)
        containerView.addSubview(nameLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.height.equalTo(20.2)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        
        /*underlineView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(4)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }*/
    }
    
    private func setupProperties() {
        
        nameLabel.configureWith(item.name,
                                color: .black.withAlphaComponent(0.4),
                                alignment: .center,
                                size: 11,
                                weight: .semibold)
        //underlineView.backgroundColor = .white
        //underlineView.setupCornerRadius(2)
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
    }
    
    private func animateItems() {
        
        UIView.animate(withDuration: 0.4) { [unowned self] in
            self.nameLabel.alpha = self.isSelected ? 0.0 : 1.0
            //self.underlineView.alpha = self.isSelected ? 1.0 : 0.0
        }
        UIView.transition(with: iconImageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve) { [unowned self] in
            
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}
