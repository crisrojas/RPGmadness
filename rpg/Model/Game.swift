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
    var lang = Lang()
    
    func start() {
        lang.setLang()
        welcome()
        naming()
        play()
    }
    
   
    func welcome() {
           print("\(lang.welcome)\n\n")
           print("  /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$\n | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$\n | $$  \\ $$| $$  \\ $$| $$  \\__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$\n | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/\n | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \\ $$| $$$$$$$$|  $$$$$$|  $$$$$$\n | $$  \\ $$| $$      | $$  \\ $$| $$\\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \\____  $$\\____  $$\n | $$  | $$| $$      |  $$$$$$/| $$ \\/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/\n |__/  |__/|__/       \\______/ |__/     |__/ \\_______/ \\_______/|__/  |__/ \\_______/|_______/|_______/\n\n")
       }
    
    func naming() {
        var name: String?
        var names = [String]()

        for i in 0..<players.count {
           
            print("\n👤 Player \(i+1), \(game.lang.yourname)")
            players[i].name = readLine()!
            print("\n\(players[i].name) \(game.lang.namecharacters)")
            
            for x in 0..<players[i].characters.count {
                print("\(game.lang.character) \(x+1):")
                 name = readLine() // todo: we're using "name" two times which isn't efficient?
                
               
                while name == "" || self.nameExists(names: names, name: name!) {
                    print("\n\(game.lang.errorNaming)")
                    print("\(game.lang.character) \(x+1):")
                    name = readLine()
                }
                
                
                names.append(name!)
                players[i].characters[x].name = name
                
                
            }
            
        }

    }
    
    func play() {
        while players[0].teamIsDead() == false && players[1].teamIsDead() == false{
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
                print("\(player.name) \(lang.won) 💪!\n")
                
            }
            print("\(player.name) made \(player.count) movements")
            
        }
            
    }
    
   
    
   
}

// HELPERS

extension Game {
    func nameExists(names: [String], name: String) -> Bool {
           var exists = false
           if names.firstIndex(of: name) != nil {
               exists = true
           }
           return exists
       }
}

