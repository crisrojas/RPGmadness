//
//  Character.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT 
//

import Foundation

class Character {
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
        health -= damage
        if health < 0 {
            health = 0
        }
    }
    
}




class Elf : Character {
    
}



// HELPERS

extension Character: Equatable {
    static func ==(firstCharacter: Character, secondCharacter: Character) -> Bool { // Put inside extension in the next push
            return firstCharacter.name == secondCharacter.name
    }
    func isDead() -> Bool {
          return health <= 0
      }
}
