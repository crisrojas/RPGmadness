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
    var characters : [Character] = [Character(), Character(), Character()]
    var count = Int()
    func teamIsDead() -> Bool {
        return teamHealth == 0
    }
    var teamHealth : Int {
        var total : Int = Int()
        for character in characters {
            total += character.health
        }
        return total
    }
    
    func move(against player: Player) {
        var inputStr = String()
        let random = Int.random(in: 1..<5)
        let matchingNumber = 3
        print("random: \(random)")
        print("matching: \(matchingNumber)")
        
        var action = Int()
        var senderId = Int()
        var receiverId = Int()
        
        repeat {
            print("\n⚔️ \(name)")
            print("1.🗡 \(game.lang.attack)")
            print("2.💉 \(game.lang.heal)\n")
            inputStr = readLine()!
        } while inputStr != "1" && inputStr != "2"
        

        action = Int(inputStr)!
        if action == 1 {
                repeat {
                print("\(game.lang.whoAttacks)")
                for i in 0..<characters.count {
                    print("\(i+1). \(characters[i].name!)")
                }
                inputStr = readLine()!
            } while inputStr != "1" && inputStr != "2" && inputStr != "3"
            senderId = Int(inputStr)!
            
      
            
            repeat {
                print("\(game.lang.whoIsAttacked)")
               for i in 0..<player.characters.count {
                    print("\(i+1). \(player.characters[i].name!)")
                }
                inputStr = readLine()!
            } while inputStr != "1" && inputStr != "2" && inputStr != "3" // todo: implement a boolean that ranges throug characters.count
            
            receiverId = Int(inputStr)!
            
            let sender = characters[senderId-1]
            let receiver = player.characters[receiverId-1]
            if random == matchingNumber {
                print("\(sender.name!) has found a weapon")
                sender.weapon.power *= random
            }
            sender.attackEnemy(character: receiver)
            if receiver.isDead() {
                print("\(receiver.name!) \(game.lang.isDead) \n")
                let characterIndex = player.characters.firstIndex(of: receiver)
                player.characters.remove(at: characterIndex!)
                
            } else {
                print("\(receiver.name!) \(game.lang.healthIs) \(receiver.health)")
            }
        } else {
            repeat {
                print("\(game.lang.whoHeals)")
                for i in 0..<characters.count {
                    print("\(i+1). \(characters[i].name!)")
                }
                inputStr = readLine()!
            } while inputStr != "1" && inputStr != "2" && inputStr != "3"
            
            senderId = Int(inputStr)!
            
            repeat {
                print("\(game.lang.whoIsHealed)")
                for i in 0..<characters.count {
                    print("\(i+1). \(characters[i].name!)")
                }
                inputStr = readLine()!
            } while inputStr != "1" && inputStr != "2" && inputStr != "3"
            
            receiverId = Int(inputStr)!
            
            let sender = characters[senderId-1]
            let receiver = characters[receiverId-1]
            
            sender.healComrade(character: receiver)
            print("\(receiver.name!) \(game.lang.healthIs) \(receiver.health)")
        }
        

    }
}
