//
//  RepeatedDNASequences.swift
//  LeetCode
//
//  Created by William Boles on 03/02/2022.
//

import Foundation

//https://leetcode.com/problems/repeated-dna-sequences/
//sliding window
struct RepeatedDNASequences {
    
    //Time: O(n) `n` is number of elements in `s`
    //Space: O(n) `n` is the number of elements in `s`
    //dictionary
    //
    //Solution Description:
    //Using a sliding window approach we set the window size (10 characters - 0...9) and move through `s` storing each
    //10 character sequence that we come across in a set. If the set already contains the current sequence then we know
    //that we have a repeat and can add it to the `repeatedSequences` set. Each iteration through the loop we increment
    //the left and right index to keep the same window size and ensure that we are moving forward.
    static func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else {
            return [String]()
        }
        
        var left = 0
        var right = 9
        
        var sequences = Set<String>()
        var repeatedSequences = Set<String>()
        let characters = Array(s)
        
        while right < characters.count {
            let sequence = String(characters[left...right])//take a sliding slice
            
            if sequences.contains(sequence) { //if it already exists it is repeating
                repeatedSequences.insert(sequence)
            }
            
            sequences.insert(sequence)
            
            left += 1
            right += 1
        }
        
        return Array(repeatedSequences)
    }
}
