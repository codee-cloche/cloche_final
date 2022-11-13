//
//  AddViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

class AddViewController: UIViewController {

    private let item: CustomTabItem
    
    init(item: CustomTabItem) {
                self.item = item
                super.init(nibName: nil, bundle: nil)
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var addItemsView = AddItemViewController()
    var addOutfitView = AddOutfitViewController()
    
    
    /*
     //TODO: should be a menu button
    var menuButton : UIButton {
        let button = UIButton()
        let addItem = UIAction(title: "아이템 추가하기", image: UIImage(systemName: "c.circle")) { (action) in

                 print("아이템 추가하기가 눌러짐.")
            }

        let addOutfit = UIAction(title: "조합 추가하기", image: UIImage(systemName: "puzzle.extension")) { (action) in

                print("조합 추가하기가 눌러짐.")
        }
          
        let menu = UIMenu(title: "추가하기", options: .displayInline, children: [addItem, addOutfit])
        button.menu = menu
        button.showsMenuAsPrimaryAction = true
        return button
    }*/
    
    var segmentedContol = CustomSegmentedControl()
    var saveButton = UIButton()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        addSubviews()
        configureSegmentedControl()
        configureSaveButton()
        }
        
    func addSubviews(){
        self.view.addSubview(segmentedContol)
        self.view.addSubview(saveButton)
        
        self.add(addItemsView)
        self.addItemsView.view.frame = CGRect(x: 0, y: 120, width: self.view.frame.width, height: self.view.frame.height)
        self.add(addOutfitView)
        self.addOutfitView.view.frame = CGRect(x: 0, y: 120, width: self.view.frame.width, height: self.view.frame.height)
        self.addOutfitView.view.isHidden = true
    }
    
    func configureSegmentedControl(){
        self.segmentedContol.backgroundColor = .clear
        self.segmentedContol.translatesAutoresizingMaskIntoConstraints = false
        self.segmentedContol.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
        self.segmentedContol.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.segmentedContol.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55).isActive = true
        self.segmentedContol.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        for button in self.segmentedContol.buttons {
            button.addTarget(self, action: #selector(didTapChangeFilter), for: .touchUpInside)
        }
    }
    
    @objc func didTapChangeFilter(){
        if (segmentedContol.selectedIndex == 0){
        self.addItemsView.view.isHidden = false
        self.addOutfitView.view.isHidden = true
            
        } else if (segmentedContol.selectedIndex == 1){
        self.addItemsView.view.isHidden = true
        self.addOutfitView.view.isHidden = false
        }
    }
    
    func configureSaveButton(){
        self.saveButton.setTitle("저장", for: .normal)
        self.saveButton.tintColor = .black
        self.saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.saveButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        self.saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24).isActive = true
        self.saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.saveButton.topAnchor.constraint(equalTo: self.segmentedContol.topAnchor).isActive = true
        self.saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
    }
    
    @objc func didTapSave(){
        
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: 40))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
