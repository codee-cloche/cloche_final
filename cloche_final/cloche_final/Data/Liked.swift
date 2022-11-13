//
//  Liked.swift
//  cloche_final
//
//  Created by grace kim  on 2022/11/01.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class LikedItemsState{
    
    static var shared = LikedItemsState()
    
    private let defaults = UserDefaults.standard
    var likedItemsObservable = BehaviorRelay<[Item]>(value: [])
    
    var LikedItems = [Item]() {
        didSet {
            self.getObserver()
//            self.saveLikedItems()
            print(self.LikedItems)
        }
    }
    
    private func getObserver(){
        self.likedItemsObservable.accept(LikedItems)
    }
    
    private func saveLikedItems(){
        //save to user defaults or upload on api.
        let data = self.LikedItems.map {
            [
                "id": $0.id,
                "imagePath": $0.imagePath,
                "name": $0.name,
                "category": $0.category,
                "color": $0.color,
                "tags": $0.tags,
                "details": $0.details,
                "liked": $0.liked,
                "timesWorn": $0.timesWorn
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey:  "likedItems")
        
    }
    
    func loadLikedItems() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "likedItems") as? [[String: Any]] else { return }

        self.LikedItems = data.compactMap {
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
    
    func addLikedItem(new_item: Item){
        if !LikedItems.contains(where: {$0.id == new_item.id}){
            self.LikedItems.append(new_item)
        }
    }
    
    func deleteLikedItem(new_item: Item){
        if LikedItems.contains(where: {$0.id == new_item.id}){
            let index = LikedItems.firstIndex(where: {$0.id == new_item.id})!
            self.LikedItems.remove(at: index)
        }
    }
}

