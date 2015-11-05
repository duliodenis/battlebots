//
//  Player.swift
//  battlebots
//
//  Created by Dulio Denis on 11/3/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, healthPoint: Int, attackPower: Int) {
        self.init(startingHealthPoint: healthPoint, startingAttackPower: attackPower)
        _name = name
    }
}