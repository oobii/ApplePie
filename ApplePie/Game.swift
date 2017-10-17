//
//  Game.swift
//  ApplePie
//
//  Created by martynov on 2017-10-16.
//  Copyright © 2017 martynov. All rights reserved.
//

import Foundation

struct Game {
    
    var word: String
    //var guessedWord: String
    var incorrectMovesRemaining: Int
    var allLetters: [Character]
    var guessedLetters: [Character]
    
    
    init(word: String, incorrectMovesRemaining: Int ) {
        self.word = word
        // not used yet
        //guessedWord = String(repeatElement("_", count: word.characters.count))
        self.allLetters = Array(word.characters)
        
       // Initially setting all elements of guessedLetters to "_"
        self.guessedLetters = Array(repeatElement("_", count: word.characters.count))
         //self.guessedLetters = word.characters.map({ (ch: Character) -> Character in  "_" })
        
        
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    mutating func checkLetter(inside letter: Character) {

        for index in word.characters.indices {
            if word[index] == letter {
                let distance = word.distance(from: word.startIndex, to: index)
                guessedLetters[distance] = letter
                
            }
            
        }
}

}
