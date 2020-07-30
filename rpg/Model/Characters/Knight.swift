//
//  Knight.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Knight : Character {
    override init() {
           super.init()
           health = 20 //110
           weapon = Sword()
           emoji = "⚔️"
    }
}
