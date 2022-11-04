//
//  ProfileViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

class ProfileViewController: UIViewController {

    //reference: 에브리타임 계정 설정 탭
    
    private let item: CustomTabItem
    private var usernameLabel = UIView()
    private var accountSettings = UITableView()
    private var appSettings = UITableView()
    
    
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

        
    }

   

}
