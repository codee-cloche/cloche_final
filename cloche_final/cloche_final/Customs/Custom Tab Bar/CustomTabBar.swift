//
//  CustomTabBar.swift
//  CustomTabBarExample
//
//  Created by Jędrzej Chołuj on 18/12/2021.
//
import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class CustomTabBar: UIStackView {
    
    var itemTapped: Observable<Int> { itemTappedSubject.asObservable() }
    
    private lazy var customItemViews: [CustomItemView] = [homeItem, outfitItem, favoriteItem, profileItem]
    
    private let homeItem = CustomItemView(with: .home, index: 0)
    private let favoriteItem = CustomItemView(with: .favorite, index: 3)
    private let outfitItem = CustomItemView(with: .outfit, index: 1)
    private let addItem = UIButton()
    private let profileItem = CustomItemView(with: .profile, index: 4)
    
    private let itemTappedSubject = PublishSubject<Int>()
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        
        setupHierarchy()
        setupProperties()
        bind()
        
        setNeedsLayout()
        layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addArrangedSubviews([homeItem, outfitItem, addItem, favoriteItem, profileItem])
    }
    
    private func setupProperties() {
        self.addItem.setImage(UIImage(systemName: "plus"), for: .normal)
        self.addItem.tintColor = .lightGray
        self.addItem.translatesAutoresizingMaskIntoConstraints = false
        self.addItem.widthAnchor.constraint(equalToConstant: 24).isActive = true
        self.addItem.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        distribution = .fillEqually
        alignment = .center
        
        backgroundColor = .white
        setupCornerRadius(25)
        
        self.addItem.showsMenuAsPrimaryAction = true
        self.addItem.menu = UIMenu(children: [
            UIAction(title: "아이템 추가", handler: { action in
                NotificationCenter.default.post(name: NSNotification.Name("addItem"), object: nil)
            }),
            UIAction(title: "조합 추가", handler: { action in
                NotificationCenter.default.post(name: NSNotification.Name("addItem"), object: nil)
            })
        ])
        
        customItemViews.forEach {
            //TODO: make the bottom text show
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
        }
    }
    
    private func selectItem(index: Int) {
        customItemViews.forEach { $0.isSelected = $0.index == index }
        itemTappedSubject.onNext(index)
    }
    
    
    //MARK: - Bindings
    
    private func bind() {
        homeItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.homeItem.animateClick {
                    self.addItem.isSelected = false
                    self.selectItem(index: self.homeItem.index)
                    self.addItem.tintColor = .lightGray
                }
            }
            .disposed(by: disposeBag)
        
        outfitItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else {return}
                self.outfitItem.animateClick {
                    self.addItem.isSelected = false
                    self.selectItem(index: self.outfitItem.index)
                    self.addItem.tintColor = .lightGray
                }
            }
            .disposed(by: disposeBag)
        
        addItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else {return}
                
                self.addItem.isSelected = true
                UIView.transition(with: self.addItem,
                                  duration: 0.2,
                                  options: .transitionCrossDissolve) { [unowned self] in
                    let black_plus = UIImage(systemName: "plus")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                    let grey_plus = UIImage(systemName: "plus")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
                    self.addItem.setImage(black_plus, for: .selected)
                    self.addItem.setImage(grey_plus, for: .normal)
                    
                }
            }
            .disposed(by: disposeBag)
        
        profileItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else {return}
                self.profileItem.animateClick {
                    self.addItem.tintColor = .lightGray
                    self.addItem.isSelected = false
                    self.selectItem(index: self.profileItem.index)
                }
            }
            .disposed(by: disposeBag)
        
        favoriteItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.favoriteItem.animateClick {
                    self.addItem.tintColor = .lightGray
                    self.addItem.isSelected = false
                    self.selectItem(index: self.favoriteItem.index)
                }
            }
            .disposed(by: disposeBag)
    }
}
