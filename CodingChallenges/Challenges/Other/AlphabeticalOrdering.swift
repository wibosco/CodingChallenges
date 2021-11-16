//
//  AlphabeticalOrdering.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class AlphabeticalOrdering {
     static func sort(string: String) -> String {
         let seperateWords = string.split(separator: " ").map { String($0) }
        
        let sortedWords = seperateWords.sorted(by: { (i: String, j: String) -> Bool in
            var shortestWord: String
            
            if i.count > j.count {
                shortestWord = j
            } else {
                shortestWord = i
            }
            
            /*----------------*/
            
            for index in shortestWord.indices {
                let iCharacter = i[index]
                let jCharacter = j[index]
                
                if iCharacter > jCharacter {
                    return false
                } else if jCharacter > iCharacter {
                    return true
                }
            }
            
            /*----------------*/
            
            if i.count > j.count {
                return false
            } else {
                return true
            }
        })
        
        return sortedWords.joined(separator: " ")
    }
}
