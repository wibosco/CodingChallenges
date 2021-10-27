//
//  CaesarCipher.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/caesar-cipher-1
class CaesarCipher: NSObject {

    class func encrypt(originalString: String, rotate: Int) -> String {
        
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
                
                encryptedCharacter = CaesarCipher.retrieveCharacterAfterRotation(character: character, characterSet: uncapitalisedLetters, rotate: rotate)
            }
            else if capitalisedLetters.contains(character) {
                
                encryptedCharacter = CaesarCipher.retrieveCharacterAfterRotation(character: character, characterSet: capitalisedLetters, rotate: rotate)
            }
            
            encryptedString += String(encryptedCharacter)
        }
        
        return encryptedString
    }
    
    class func retrieveCharacterAfterRotation(character: Character, characterSet: [Character], rotate: Int) -> Character {
        
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
