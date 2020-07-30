//
//  Player.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT
//

import Foundation

class Player {
    var name = ""
    var team = [Character]()
    // The count variable will be updated every time player makes a move. It will be used in the statistics at the end of the game
    var count = Int()
    
    var teamHealth : Int {
        var total : Int = Int()
        for character in team {
            total += character.health
        }
        return total
    }
    
    func teamIsDead() -> Bool {
        return teamHealth == 0
    }
    
    func createCharacters() {
        var input = ""
        var characterName = ""
        var character = Character()
        var names = [String]()
        
        while team.count < game.numberOfCharacters {
            repeat {
                print("\n\n\(name), \(game.text.chooseKind) \(team.count + 1)"
                    + "\n1. 🗡 \(game.text.knight). 💉: 110. 💪: 50."
                    + "\n2. 🏹 \(game.text.archer). 💉: 100. 💪: 60"
                    + "\n3. 🧙🏻‍♂️ \(game.text.magician). 💉: 70. 💪: 70\n")
                input = readLine()!
            } while input != "1" && input != "2" && input != "3"
            
            switch input {
            case "1":
                character = Knight()
            case "2":
                character = Archer()
            case "3":
                character = Magician()
            default:
                break
            }
            
            repeat {
                print("\(game.text.nameCharacter) \(team.count + 1). \(game.text.nameConstraints)")
                characterName = readLine()!
                characterName = characterName.lowercased()
                characterName = characterName.capitalized
            } while characterName.isBlank || nameExists(names: names, name: characterName)
            
            
            
            print(characterName)
            character.name = characterName
            names.append(characterName)
            team.append(character)
        }
        
    }
    
    func move(against player: Player) {
        var inputStr = String()
        var action = Int()
        
        repeat {
            print("\n\(game.text.turn) \(name)")
            print("1.⚔️ \(game.text.attack)")
            print("2.💉 \(game.text.heal)\n")
            inputStr = readLine()!
        } while inputStr != "1" && inputStr != "2"
        action = Int(inputStr)!
        
        if action == 1 {
            attack(against: player)
        } else {
            heal()
        }
        
    }
    
    func attack(against player: Player) {
        //print(game.text.whoAttacks)
        rangeThrougPlayers(player: self)
        let attackerIndex = Utilities.waitForInput(message: game.text.whoAttacks, condition: 1...team.count) - 1
        let attacker = team[attackerIndex]
        
        Weapon.randomWeapon(character: attacker)
        
        //print(game.text.whoIsAttacked)
        rangeThrougPlayers(player: player)
        let enemyIndex = Utilities.waitForInput(message: game.text.whoIsAttacked, condition: 1...player.team.count) - 1
        let enemy = player.team[enemyIndex]
        
        attacker.attackEnemy(character: enemy)
        
        if enemy.isDead() {
            print("\(enemy.name!) \(game.text.isDead) \n")
            let characterIndex = player.team.firstIndex(of: enemy)
            player.team.remove(at: characterIndex!)
            
        } else {
            print("\(enemy.name!) \(game.text.healthIs) \(enemy.health)")
        }
    }
    
    func heal() {
       // print(game.text.whoHeals)
        rangeThrougPlayers(player: self)
        let healerIndex = Utilities.waitForInput(message: game.text.whoHeals, condition: 1...team.count) - 1
        let healer = team[healerIndex]
        
        //print(game.text.whoIsHealed)
        rangeThrougPlayers(player: self)
        let comradeIndex = Utilities.waitForInput(message: game.text.whoIsHealed, condition: 1...team.count) - 1
        let comrade = team[comradeIndex]
        
        healer.healComrade(character: comrade)
        print("\(comrade.name!) \(game.text.healthIs) \(comrade.health)")
    }
    
    func rangeThrougPlayers(player: Player) {
        for i in 0..<player.team.count {
            print("\(i+1). \(player.team[i].emoji!) \(player.team[i].name!). 💉: \(player.team[i].health). 💪: \(player.team[i].weapon.power)")
        }
    }
    
}



extension Player {
    func nameExists(names: [String], name: String) -> Bool {
        var exists = false
        if names.firstIndex(of: name) != nil {
            exists = true
        }
        return exists
    }
}
