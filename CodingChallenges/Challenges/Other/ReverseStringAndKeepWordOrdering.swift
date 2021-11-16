//
//  ReverseStringA.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class ReverseStringAndKeepWordOrdering {
    static func reverse(string: String) -> String {
        let seperateWords = string.split(separator: " ").map { String($0) }
        
        var reversedSentence = [String]()
        
        for word in seperateWords {
            reversedSentence.append(String(word.reversed()))
        }
        
        return reversedSentence.joined(separator: " ")
    }
}
