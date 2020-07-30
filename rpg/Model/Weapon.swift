//
//  Weapon.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT
//

import Foundation

class Weapon {
    var power : Int = 40
    
    static func randomWeapon(character: Character) {
        let random = Int.random(in: 1..<3)
        let matchingNumber = 1
        if random == matchingNumber {
            character.weapon.power *= Int.random(in: 1..<5)
            print("\(character.name!) \(game.text.foundWeapon) \(character.weapon.power)")
            
        }
    }
}
