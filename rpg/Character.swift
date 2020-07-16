//
//  Character.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Character: Equatable {
    var name : String?
    var health : Int  = 20
    var weapon : Weapon = Weapon()
    
    func healComrade(character: Character) {
        character.health += 10
    }
    
    func attackEnemy(character: Character) {
        character.receiveDamage(damage: self.weapon.power)
    }
    func receiveDamage(damage: Int) {
        self.health -= damage
        if self.health < 0 {
            self.health = 0
        }
    }
    static func ==(firstCharacter: Character, secondCharacter: Character) -> Bool {
            return firstCharacter.name == secondCharacter.name
    }
}
