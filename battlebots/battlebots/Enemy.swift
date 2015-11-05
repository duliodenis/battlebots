//
//  Enemy.swift
//  battlebots
//
//  Created by Dulio Denis on 11/3/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty Daggar", "Cracked Buckler"]
    }
    
    var type: String {
        return "Blue"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}