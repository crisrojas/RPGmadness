//
//  Player.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Player {
    var name: String?
    var characters : [Character] = [Character(), Character(), Character()]
    var teamHealth : Int {
        var total : Int = Int()
        for character in characters {
            total += character.health
        }
        return total
    }
    
    func move(against player: Player) {
        
        var action = Int()
        var senderId = Int()
        var receiverId = Int()
        
        repeat {
            print("\n⚔️ \(self.name!)'s turn")
            print("1.🗡 Attack")
            print("2.💉 Heal\n")
            action = Int(input())!
        } while action != 1 && action != 2
        
        // If player choses to attack
        
        if action == 1 {
            // We ask player to chose who's going to attack
            repeat {
                print("Who's gonna attack?")
                for i in 0..<self.characters.count {
                    print("\(i+1). \(self.characters[i].name!)")
                }
                senderId = Int(input())!
            } while senderId != 1 && senderId != 2 && senderId != 3
            repeat {
                print("Who's gonna be attacked?")
               for i in 0..<player.characters.count {
                    print("\(i+1). \(player.characters[i].name!)")
                }
                receiverId = Int(input())!
            } while receiverId != 1 && receiverId != 2 && receiverId != 3
            
            let sender = self.characters[senderId-1]
            let receiver = player.characters[receiverId-1]
            
            sender.attackEnemy(character: receiver)
            if receiver.health == 0 {
                // todo: remove from array
                print("\(receiver.name!) is dead!\n")
                let characterIndex = player.characters.firstIndex(of: receiver)
                player.characters.remove(at: characterIndex!)
                
            } else {
                print("\(receiver.name!) health is now: \(receiver.health)")
            }
        } else {
            repeat {
                print("Who's gonna heal?")
                for i in 0..<self.characters.count {
                    print("\(i+1). \(self.characters[i].name!)")
                }
                senderId = Int(input())!
            } while senderId != 1 && senderId != 2 && senderId != 3
            repeat {
                print("Who's gonna be healed?")
                for i in 0..<self.characters.count {
                    print("\(i+1). \(self.characters[i].name!)")
                }
                receiverId = Int(input())!
            } while receiverId != 1 && receiverId != 2 && receiverId != 3
            
            
            let sender = self.characters[senderId-1]
            let receiver = self.characters[receiverId-1]
            
            sender.healComrade(character: receiver)
            print("\(receiver.name!) health is now: \(receiver.health)")
        }
        

    }
}
