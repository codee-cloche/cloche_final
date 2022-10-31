//
//  TabBarViewController.swift
//  codee_sepVer
//
//  Created by grace kim  on 2022/09/19.
//

import UIKit


class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tab1 = UINavigationController(rootViewController: ItemsViewController())
        let tab2 = UINavigationController(rootViewController: UIViewController())
        let tab3 = UINavigationController(rootViewController: AddItemViewController())
        let tab4 = UINavigationController(rootViewController: UIViewController())
        let tab5 = UINavigationController(rootViewController: UIViewController())
        
        
        let tab1_BarItem = UITabBarItem(title: "클로젯", image: UIImage(named: "c"), selectedImage:  UIImage(named: "c"))
        
        tab1.tabBarItem = tab1_BarItem
    
       
        let tab2_BarItem = UITabBarItem(title: "조합하기", image: UIImage(systemName: "puzzlepiece.extension"), selectedImage:  UIImage(systemName: "puzzlepiece.extension"))
        
        tab2.tabBarItem = tab2_BarItem
        
    
        
        let addItem = UIAction(title: "아이템 추가하기", image: UIImage(systemName: "tshirt")) { (action) in
                print("add item was tapped")
           }

        let addOutfit = UIAction(title: "조합 추가하기", image: UIImage(systemName: "puzzlepiece.extension")) { (action) in

               print("add outfit was tapped")
           }
        let tab3_menuButton = UIButton()
        tab3_menuButton.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let menu = UIMenu(children: [addItem, addOutfit])
        let tab3_barButton = UITabBarItem(title: "추가하기", image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus"))
       
        tab3.tabBarItem = tab3_barButton
        tab3_menuButton.menu = menu
        tab3_menuButton.showsMenuAsPrimaryAction = true
        
        
        //make tab3 a pop up menu button
        
        let tab4_BarItem = UITabBarItem(title: "좋아요", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        tab4.tabBarItem = tab4_BarItem
        
        let tab5_BarItem = UITabBarItem(title: "마이", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tab5.tabBarItem = tab5_BarItem
        self.viewControllers = [tab1, tab2, tab4, tab5]
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //print("Selected \(viewController.title!)")
    }
}
