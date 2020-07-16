/*
 
main.swift
Created by Cristian Rojas on 10/07/2020.
Copyright © 2020 Cristian Rojas. All rights reserved.


 
 /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$
 | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$
 | $$  \ $$| $$  \ $$| $$  \__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$
 | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/
 | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \ $$| $$$$$$$$|  $$$$$$|  $$$$$$
 | $$  \ $$| $$      | $$  \ $$| $$\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \____  $$\____  $$
 | $$  | $$| $$      |  $$$$$$/| $$ \/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/
 |__/  |__/|__/       \______/ |__/     |__/ \_______/ \_______/|__/  |__/ \_______/|_______/|_______/
                                                                                                       
 
 */


// We're going to need "Foundation" for our math operations so we import it at the beginning of each document:
import Foundation



// We create the input function that will allow us to query the user. We'ill reuse it multiple times.

func input() -> String {
    /* the readLine() function asks the user for a value
       We will store that value (whatever it will be) in a variable "userInput"
     */
    let userInput = readLine()
    return userInput!
}



/* We will create two players */

// player 1 and ...
var player1 = Player()
// player 2
var player2 = Player()
// We're going to store them inside an array
var players = [player1, player2]

// We will create two empty variables that we're going to use to store the names of the chacters
// The first one will be a String variable that will change every time the player will give a name to it's characters
var name: String?
/* Each time the variable "name" changes we will store the new value in a names array
    This way if the user enters a name that already exists, we will check inside our names array and we wil ask him to
    enter a valid name
 */
var names = [String]()


print("Welcome to RPG madness\n\n")
print("  /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$\n | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$\n | $$  \\ $$| $$  \\ $$| $$  \\__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$\n | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/\n | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \\ $$| $$$$$$$$|  $$$$$$|  $$$$$$\n | $$  \\ $$| $$      | $$  \\ $$| $$\\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \\____  $$\\____  $$\n | $$  | $$| $$      |  $$$$$$/| $$ \\/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/\n |__/  |__/|__/       \\______/ |__/     |__/ \\_______/ \\_______/|__/  |__/ \\_______/|_______/|_______/\n\n")

// For each player we will...
for i in 0..<players.count {
    // ...ask his name
    print("\n👤 Player \(i+1), what's your name?")
    players[i].name = input()
    // ask to name each of his characters, for that...
    print("\n\(players[i].name!) name your characters")
    // ...for each character
    for x in 0..<players[i].characters.count {
        print("Character \(x+1) name:")
        // we ask user to input the character's name
        name = input()
        
        // If is an empty name or a taken one we ask again the user to enter a valid one
        while name == "" || nameExists(names: names, name: name!) {
            print("\nName cannot be empty nor taken, try again please")
            print("Character \(x+1) name:")
            name = input()
        }
        
        
        // If name isn't empty and it doesn't exist, we add the name to our name's list
        names.append(name!)
        players[i].characters[x].name = name
        
        // We add the health to the group
        
    }
    
}


// Checks if name exits already
func nameExists(names: [String], name: String) -> Bool {
    var exists = false
    if names.firstIndex(of: name) != nil {
        exists = true
    }
    return exists
}

var player1Count = Int()
var player2Count = Int()
while player1.teamHealth != 0 && player2.teamHealth != 0 {
    
    player1.move(against: player2)
    player1Count += 1
    if player2.teamHealth > 0 {
        player2.move(against: player1)
        player2Count += 1
    }
}

for player in players {
    if player.teamHealth > 0 {
        print("\(player.name!) Won!")
    }
    
}

print("\(player1.name!) made \(player1Count) movements\n\(player2.name!) made \(player2Count) movements")


/*
 
 
 ### Todo:
 
 - Arme aléatoire
 - Statistiques de fin de partie: joueur gagnant, nombre de tours, liste des personnages des deux équipes avec leurs propriétés (point de vie, etc.).
 - Differents langues
 
 #### Errors to fix:
 
 - ✅ The while looping that checks if name isn't empty doesn't execute if user enters first an already taken name. How to reacreate this problem
    1. Enter an already taken name
    2. Enter an empty name
 
 - If player choose an action that is out of range the app (obviously!) crashes. See move function
 */
