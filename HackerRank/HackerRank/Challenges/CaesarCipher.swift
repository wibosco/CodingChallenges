//
//  CaesarCipher.swift
//  HackerRank
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/caesar-cipher-1
final class CaesarCipher {

     static func encrypt(originalString: String, rotate: Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"

        var uncapitalisedLetters = [Character]()
        var capitalisedLetters = [Character]()
        
        for letter in alphabet {
            uncapitalisedLetters.append(letter)
            capitalisedLetters.append(Character(String(letter).capitalized))
        }
        
        var encryptedString = ""
        
        for character in originalString {
            var encryptedCharacter = character
            
            if uncapitalisedLetters.contains(character) {
                encryptedCharacter = retrieveCharacterAfterRotation(character: character, characterSet: uncapitalisedLetters, rotate: rotate)
            } else if capitalisedLetters.contains(character) {
                encryptedCharacter = retrieveCharacterAfterRotation(character: character, characterSet: capitalisedLetters, rotate: rotate)
            }
            
            encryptedString += String(encryptedCharacter)
        }
        
        return encryptedString
    }
    
     static func retrieveCharacterAfterRotation(character: Character, characterSet: [Character], rotate: Int) -> Character {
        let index = characterSet.firstIndex(of: character)!
        let indexAfterRotation = index + rotate
        var indexForEncryptedCharacter = indexAfterRotation
        
        if indexForEncryptedCharacter > (characterSet.count - 1) {
            var withinRange = false
            
            while !withinRange {
                indexForEncryptedCharacter -= characterSet.count
                
                withinRange = !(indexForEncryptedCharacter > (characterSet.count - 1))
            }
        }
        
        return characterSet[indexForEncryptedCharacter]
    }
    
}
