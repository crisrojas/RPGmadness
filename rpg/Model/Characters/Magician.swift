//
//  Magician.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Magician : Character {
    override init() {
           super.init()
           health = 20 // 85
           weapon = Wand()
           emoji = "🧙🏻‍♂️"
    }
}
