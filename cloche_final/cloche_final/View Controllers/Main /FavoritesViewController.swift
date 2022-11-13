//
//  FavoritesViewController.swift
//  cloche_final
//
//  Created by grace kim  on 2022/10/31.
//

import UIKit

class FavoritesViewController: UIViewController {

    private let item: CustomTabItem
    
    init(item: CustomTabItem) {
                self.item = item
                super.init(nibName: nil, bundle: nil)
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func didTapAddItem(){
        let VC = AddItemViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
