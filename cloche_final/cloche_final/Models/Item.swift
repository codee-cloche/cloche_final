//
//  Item.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/01.
//

import UIKit
import Foundation
import RxSwift


struct Item {
    //necessary: id, name, category, liked
    //TODO: should cateogry be a struct of itself?
    
    let id: Int
    let imagePath : String?
    let name : String
    let category: String
    let color : UIColor?
    let tags : [String]?
    let details : String?
    let liked : Bool
}

