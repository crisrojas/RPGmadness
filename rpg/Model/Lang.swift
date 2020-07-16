//
//  Lang.swift
//  rpg
//
//  Created by Cristian Rojas on 16/07/2020.
//  MIT
//


struct Lang {
    var welcome = ""
    var yourname = ""
    var namecharacters = ""
    var errorNaming = ""
    var character = ""
    var won = ""
    var attack = ""
    var heal = ""
    var whoAttacks = ""
    var whoHeals = ""
    var whoIsAttacked = ""
    var whoIsHealed = ""
    var healthIs = ""
    var isDead = ""
    
    mutating func setLang() { /* mettre choix dans la classe game*/ /* mutating me laisse changer les propriétés d'un struct*/
        var inputTxt = ""
        repeat {
            print("\n\n\n1. 🥖 Français")
            print("2. 💃🏻 Español")
            print("3. 🏈 English")
            inputTxt = readLine()!
        } while inputTxt != "1" && inputTxt != "2" && inputTxt != "3"

        let language = Int(inputTxt)! // Eviter d'utiliser des points d'exclamation car induit des problèmes

        switch language {
        case 1:
            welcome = "\n\nBienvenu à RPGmadness"
            yourname = "quel est ton prenom?"
            namecharacters = "nomme tes personnages"
            errorNaming = "Le nom ne peut pas être vide ni repété"
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
        case 2:
            welcome = "\n\nBienvenido a RPGmadness"
            yourname = "cuál es tu nombre?"
            namecharacters = "nombra a tus personajes"
            errorNaming = "El nombre no puede estar vacío ni repetido"
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
        case 3:
            welcome = "\n\nWelcome to RPG madness"
            yourname = "what's your name?"
            namecharacters = "name your characters"
            errorNaming = "Name can't be empty nor taken"
            character = "Character"
            won = "won"
            attack = "Attack"
            heal = "Heal"
            whoAttacks = "Who's going to attack?"
            whoHeals = "Who's going to heal?"
            whoIsAttacked = "Who's going to be attacked?"
            whoIsHealed = "Who's going to be healed?"
            healthIs = "health is now:"
            isDead = "is dead!"
        default:
            break
        }
    }
    
}
