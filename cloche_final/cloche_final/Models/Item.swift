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
    var imagePath : String?
    var name : String
    var category: String
    var color : UIColor?
    var tags : [String]?
    var details : String?
    var liked : Bool
    var timesWorn: Int = 0
}

