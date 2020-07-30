//
//  Lang.swift
//  rpg
//
//  Created by Cristian Rojas on 16/07/2020.
//  MIT
//


struct Text {
    var welcome = "\n\nWelcome to RPG madness"
    var yourname = "what's your name?"
    var nameCharacter = "Name the character"
    var nameConstraints = "Name can't be empty nor taken"
    var chooseKind = "Choose the kind of the character"
    var character = "Character"
    var won = "won"
    var attack = "Attack"
    var heal = "Heal"
    var whoAttacks = "Who's going to attack?"
    var whoHeals = "Who's going to heal?"
    var whoIsAttacked = "Who's going to be attacked?"
    var whoIsHealed = "Who's going to be healed?"
    var healthIs = "health is now:"
    var isDead = "is dead!"
    var chooseNumberOfCharacters = "Choose the number of characters per player (at least 2)"
    var knight = "Knight"
    var magician = "Magician"
    var archer = "Archer"
    var foundWeapon = "has found a weapon. Power: "
    var turn = "Turn:"
    
    mutating func setLang() { /* mettre choix dans la classe game*/ /* mutating me laisse changer les propriétés d'un struct*/
        var inputTxt = ""
        repeat {
            print("\n\n\n1. 🥖 Français")
            print("2. 💃🏻 Español")
            print("3. 🏈 English")
            inputTxt = readLine()!
        } while inputTxt != "1" && inputTxt != "2" && inputTxt != "3"

        guard let language = Int(inputTxt) else {return} // Eviter d'utiliser des points d'exclamation car induit des problèmes

        switch language {
        case 1:
            welcome = "\n\nBienvenu à RPGmadness"
            yourname = "quel est ton prenom?"
            nameCharacter = "Donne un nom au personnage"
            nameConstraints = "Le nom ne peut pas être vide ni repété"
            chooseKind = "Chossi la classe du personage"
            character = "Personnage"
            won = "gagne"
            attack = "Attaquer"
            heal = "Guérir"
            whoAttacks = "Qui va à attaquer?"
            whoHeals = "Qui va guérir?"
            whoIsAttacked = "Qui sera attaqué?"
            whoIsHealed = "Qui sera guéri?"
            healthIs = "vie:"
            isDead = "est mort!"
            chooseNumberOfCharacters = "Choissisez le nombre de personnages par joueur (2 au minimum)"
            knight = "Chevalier"
            magician = "Magicien"
            archer = "Archer"
            foundWeapon = "a trouvé une arme. Pouvoir de l'arme:"
            turn = "Tour:"
        case 2:
            welcome = "\n\nBienvenido a RPGmadness"
            yourname = "cuál es tu nombre?"
            nameCharacter = "Da un nombre al personaje"
            nameConstraints = "El nombre no puede estar vacío ni repetido"
            chooseKind = "Elije la clase del personaje"
            character = "Personaje"
            won = "gana"
            attack = "Atacar"
            heal = "Curar"
            whoAttacks = "Quién va a atacar?"
            whoHeals = "Quién cura?"
            whoIsAttacked = "Quién será atacado?"
            whoIsHealed = "Quién será curado?"
            healthIs = "vida:"
            isDead = "ha muerto!"
            chooseNumberOfCharacters = "Elije el número de personajes por jugador (2 como mínimo)"
            knight = "Caballero"
            magician = "Mago"
            archer = "Arquero"
            foundWeapon = "ha encontrado un arma. Poder del arma:"
            turn = "Turno:"
        case 3:
            return
        default:
            break
        }
    }
    
}
