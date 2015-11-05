//
//  ViewController.swift
//  battlebots
//
//  Created by Dulio Denis on 11/3/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHealthPointLabel: UILabel!
    @IBOutlet weak var enemyHealthPointLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", healthPoint: 110, attackPower: 20)
        playerHealthPointLabel.text = "\(player.healthPoint) HP"
        
        generateRandomEnemy()
    }
    
    
    // MARK: Helper Methods
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHealthPoint: 110, startingAttackPower: 12)
        } else {
            enemy = DevilWizard(startingHealthPoint: 60, startingAttackPower: 15)
        }
        
        enemyImage.hidden = false
    }
    
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: UIButton!) {
        if enemy.attemptAttack(player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHealthPointLabel.text = "\(enemy.healthPoint) HP"
        } else {
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHealthPointLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImage.hidden = true
        }
    }
    
    
}

