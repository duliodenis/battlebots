//
//  DevilWizard.swift
//  battlebots
//
//  Created by Dulio Denis on 11/3/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}