//
//  CustomTabItem.swift
//  CustomTabBarExample
//
//  Created by Jędrzej Chołuj on 18/12/2021.
//
import UIKit

enum CustomTabItem: String, CaseIterable {
    case home
    case outfit
    case add
    case favorite
    case profile
}
 
extension CustomTabItem {
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController(item: .home)
        case .outfit:
            return OutfitViewController(item: .outfit)
        case .add:
            return AddViewController(item: .add)
        case .favorite:
            return FavoritesViewController(item: .favorite)
        case .profile:
            return ProfileViewController(item: .profile)
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "c.circle")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
       
        case .outfit:
            return UIImage(systemName: "puzzlepiece.extension")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        
        case .add:
            return UIImage(systemName: "plus")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
    
        case .favorite:
            return UIImage(systemName: "heart")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
            
        case .profile:
            return UIImage(systemName: "person")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "c.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
       
        case .outfit:
            return UIImage(systemName: "puzzlepiece.extension.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        case .add:
            return UIImage(systemName: "plus")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
        case .favorite:
            return UIImage(systemName: "heart.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            
        case .profile:
            return UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
    }
    
    var name: String {
        //return self.rawValue.capitalized
        switch self{
        case .home:
            return "클로젯"
        case .outfit:
            return "조합하기"
        case .add:
            return "추가하기"
        case .favorite:
            return "좋아요"
        case .profile:
            return "마이"
        }
    }
}
