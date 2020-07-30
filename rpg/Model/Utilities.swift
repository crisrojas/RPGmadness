//
//  Utilities.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.


import Foundation

class Utilities {
    
   
    static func input() -> Int {
        if let result = readLine() {
            return Int(result) ?? 1
        }
        return 0
    }
    
    static func waitForInput(message: String, condition: ClosedRange<Int>) -> Int {
        var choice : Int
        repeat {
            print(message)
            choice = self.input()
        } while !condition.contains(choice)
        return choice
    }
}


extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}
