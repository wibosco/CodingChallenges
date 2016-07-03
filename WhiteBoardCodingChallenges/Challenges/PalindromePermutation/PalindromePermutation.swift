//
//  PalindromePermutation.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 1.4
class PalindromePermutation: NSObject {

    class func premutationCanBePalindrome(original: String) -> Bool {
    
        let spacesRemovedOriginal = original.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
        
        if spacesRemovedOriginal.characters.count < 2 {
            
            return false
        }
        
        //Not sure if we need this shortcut?
        if spacesRemovedOriginal.characters.count == 2 {
            
            if spacesRemovedOriginal[spacesRemovedOriginal.characters.startIndex] == spacesRemovedOriginal[spacesRemovedOriginal.characters.endIndex.advancedBy(-1)] {
                
                return true
            }
            else {
                
                return false
            }
        }
        
        let occurrences = countOccurrencesOfCharacters(spacesRemovedOriginal)
        
        var foundOddValue = false
        
        for count in occurrences.values {
            
            if count % 2 != 0 {
                
                if foundOddValue {
                    
                    return false
                }
                else {
                    
                    foundOddValue = true
                }
            }
        }
        
        return true
    }
    
    class func countOccurrencesOfCharacters(original: String) -> [String : Int] {
        
        var occurrences = [String : Int]()
        
        for character in original.characters {
            
            if occurrences[String(character)] != nil {
                
                let count = occurrences[String(character)]!
                
                occurrences[String(character)] = count+1
            }
            else {
                
                occurrences[String(character)] = 1
            }
        }
        
        return occurrences
    }
    
}
