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
            self.saveLikedItems()
        }
    }
    
    private func getObserver(){
        self.likedItemsObservable.accept(LikedItems)
    }
    
    private func saveLikedItems(){
        //save to user defaults or upload on api.
        
    }
    
    private func addLikedItem(new_item: Item){
        if !LikedItems.contains(where: {$0.id == new_item.id}){
            self.LikedItems.append(new_item)
        }
    }
    
    private func deleteLikedItem(new_item: Item){
        if LikedItems.contains(where: {$0.id == new_item.id}){
            let index = LikedItems.firstIndex(where: {$0.id == new_item.id})!
            self.LikedItems.remove(at: index)
        }
    }
}
