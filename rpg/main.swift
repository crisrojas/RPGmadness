/*
 
main.swift
Created by Cristian Rojas on 10/07/2020.
MIT 


 
 /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$
 | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$
 | $$  \ $$| $$  \ $$| $$  \__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$
 | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/
 | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \ $$| $$$$$$$$|  $$$$$$|  $$$$$$
 | $$  \ $$| $$      | $$  \ $$| $$\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \____  $$\____  $$
 | $$  | $$| $$      |  $$$$$$/| $$ \/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/
 |__/  |__/|__/       \______/ |__/     |__/ \_______/ \_______/|__/  |__/ \_______/|_______/|_______/
                                                                                                       
 
 */



import Foundation


let game = Game()
game.start()

/*
 
 ### Todo:
 
 - 🚧 Random weapon (use Int insted of drand())
 - Refactoring
 - Essayer d'éliminer les unwrappings avec "!"
 

 
 #### Errors to fix:
 
 - If player choose an action that is out of the range of the array of characters, the app crashes. Player.swift > move function > action conditionnal
 
 ### Fixed & Done
 
 - ✅ FIXED: The while looping that checks if name isn't empty doesn't execute if user enters first an already taken name
 - ✅ DONE: Statistiques de fin de partie: joueur gagnant, nombre de tours, liste des personnages des deux équipes avec leurs propriétés (point de vie, etc.).
 - ✅ Differents langues
 */



/*

We want to avoid two situations:

1. The user enters an non numeric string
2. The user enters a number that is out of the range of the indexes of the array;

let statusCode = 300
if 200 ... 299 ~= statusCode {
    print("statusCode is between 200 and 299")
} else {
    print("statusCode isn't between 200 and 299")
}



 let array = ["1", "2"] // array.count = 2
 var inputStr = String()



 repeat {
     inputStr = readLine()!
 } while inputStr != "2"
     
 
*/
