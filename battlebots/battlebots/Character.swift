//
//  Character.swift
//  battlebots
//
//  Created by Dulio Denis on 11/3/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import Foundation

class Character {
    
    private var _healthPoint: Int = 100
    private var _attackPower: Int = 10
    
    var attackPower: Int {
        return _attackPower
    }
    
    var healthPoint: Int {
        get {
            return _healthPoint
        }
    }
    
    // computed property
    var isAlive: Bool {
        get {
            if healthPoint <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHealthPoint: Int, startingAttackPower: Int) {
        self._healthPoint = startingHealthPoint
        self._attackPower = startingAttackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._healthPoint -= attackPower
        
        return true
    }
    
}
