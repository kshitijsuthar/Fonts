//
//  FavoritesList.swift
//  Fonts
//
//  Created by Kshitij Suthar on 2017-11-29.
//  Copyright © 2017 Kshitij Suthar. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList {
    
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorites(fontName: String){
        if !favorites.contains(fontName) {
            
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
   private func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func removeFavorites(fontName: String){
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    
}
