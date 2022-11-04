//
//  ItemDetailViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/02.
//

import UIKit

class ItemDetailViewController: UIViewController {

    var my_item : Item
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    init(item: Item){
        self.my_item = item
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
