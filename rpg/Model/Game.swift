//
//  Game.swift
//  rpg
//
//  Created by Cristian Rojas on 16/07/2020.
//  MIT
//

import Foundation

class Game {
    var players = [Player(), Player()]
    var text = Text()
    var numberOfCharacters = 3
    
    func start() {
        text.setLang()
        welcome()
        chooseCharacterNumber() // Uncomment if you want the users to choose the number of characters
        namingPlayers()
        play()
        restart()
    }
    
    func chooseCharacterNumber() {
        numberOfCharacters = Utilities.waitForInput(message: text.chooseNumberOfCharacters, condition: 1...10)
    }
   
    func welcome() {
           print("\(text.welcome)\n\n")
           print("  /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$\n | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$\n | $$  \\ $$| $$  \\ $$| $$  \\__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$\n | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/\n | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \\ $$| $$$$$$$$|  $$$$$$|  $$$$$$\n | $$  \\ $$| $$      | $$  \\ $$| $$\\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \\____  $$\\____  $$\n | $$  | $$| $$      |  $$$$$$/| $$ \\/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/\n |__/  |__/|__/       \\______/ |__/     |__/ \\_______/ \\_______/|__/  |__/ \\_______/|_______/|_______/\n\n")
       }
    
    func namingPlayers() {

        for i in 0..<players.count {
            var name = ""
            repeat {
                print("👤 Player \(i+1), \(text.yourname)")
                name = readLine()!
                name = name.lowercased()
                name = name.capitalized
            } while name.isBlank
            
            players[i].name = name
            players[i].createCharacters()
            
        }
    }
    
    func play() {
        while players[0].teamIsDead() == false && players[1].teamIsDead() == false { //todo: abstraer lógica
                players[0].move(against: players[1])
                players[0].count += 1
                if players[1].teamIsDead() == false {
                    players[1].move(against: players[0])
                    players[1].count += 1
                }
            }
        
        for player in players {
            if player.teamHealth > 0 {
                print("🔥🔥🔥🔥🔥")
                print("\(player.name) \(text.won) 💪!")
                print("\(player.team.count) left character out of \(game.numberOfCharacters): ") //todo: translate "left character out of"
                for character in player.team {
                    print("\(character.name!) 💉: \(character.health) + 💪: \(character.weapon.power)")
                }
                
            }
            print("\(player.name) made \(player.count) movements") // "todo: translate"
            
        }
            
    }
    func restart() {
        var choice = ""
        repeat {
            print("Restart y/n")
            choice = readLine()!
        } while choice != "y" && choice != "n" // || y es diferente a "y" Y diferente a "n" (es decir, diferente a ambos) ? no. y es diferente a "y" O "diferente a "n" ?
        
        if choice == "y" {
            welcome()
            chooseCharacterNumber() // Uncomment if you want the users to choose the number of characters
            namingPlayers()
            play()
            restart()
        } else {
            return
        }
    }
    
   
    
   
}
