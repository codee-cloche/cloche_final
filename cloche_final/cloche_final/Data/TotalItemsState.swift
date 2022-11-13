//
//  TotalItemsState.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/14.
//

import RxSwift
import Foundation
import UIKit
import RxCocoa

class TotalItemsState{
    
    static var shared = TotalItemsState()
    
    private let defaults = UserDefaults.standard
    var totalItemsObservable = BehaviorRelay<[Item]>(value: [])
    
    var totalItems = [Item]() {
        didSet {
            self.getObserver()
            //self.saveItems()
            print(self.totalItems)
        }
    }
    
    private func getObserver(){
        self.totalItemsObservable.accept(totalItems)
    }
    
    private func saveItems(){
        //save to user defaults or upload on api.
        let data = self.totalItems.map {
            [
                "id": $0.id,
                "imagePath": $0.imagePath as Any,
                "name": $0.name,
                "category": $0.category,
                "color": $0.color as Any,
                "tags": $0.tags as Any,
                "details": $0.details as Any,
                "liked": $0.liked,
                "timesWorn": $0.timesWorn
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey:  "totalItems")
        
    }
    
    func loadtotalItems() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "totalItems") as? [[String: Any]] else { return }

        self.totalItems = data.compactMap {
            guard let id = $0["id"] as? Int else { return nil }
            guard let imagePath = $0["imagePath"] as? String else { return nil }
            guard let name = $0["name"] as? String else { return nil }
            guard let category = $0["category"] as? String else { return nil }
            guard let color = $0["isLiked"] as? UIColor else { return nil }
            guard let tags = $0["tags"] as? [String] else { return nil }
            guard let details = $0["details"] as? String else { return nil }
            guard let liked = $0["liked"] as? Bool else { return nil }
            guard let timesWorn = $0["timesWorn"] as? Int else { return nil }
            return Item(id: id, imagePath: imagePath, name: name, category: category, color: color, tags: tags, details: details, liked: liked, timesWorn: timesWorn)
        }
    }
    
    func addItem(new_item: Item){
        self.totalItems.append(new_item)
    }
    
    func deleteItem(new_item: Item){
        if totalItems.contains(where: {$0.id == new_item.id}){
            let index = totalItems.firstIndex(where: {$0.id == new_item.id})!
            self.totalItems.remove(at: index)
        }
    }
}

