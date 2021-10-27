//
//  BiggerIsGreater.swift
//  CodingChallenges
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/bigger-is-greater
class BiggerIsGreater {

    //Copied from http://stackoverflow.com/questions/34968470/calculate-all-permutations-of-a-string-in-swift
     static func possiblePermutations(n:Int, a:inout [String], permutations: inout [String]) {
        
        if n == 1 {
            
            permutations.append(a.joined(separator: ""))
            
            return
        }
        
        for i in 0..<n-1 {
            
            possiblePermutations(n: n-1, a: &a, permutations: &permutations)
            
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        
        possiblePermutations(n: n-1, a: &a, permutations: &permutations)
    }
    
     static func permutationGreaterThanOrginal(original: String) -> String {
    
        guard original != String(original.reversed()) else {
            
            return "no answer"
        }
        
        var characters = original.map{String($0)}
        
        var maximumValuePermutation: String?
        
        var permutations = [String]()
        
        BiggerIsGreater.possiblePermutations(n: characters.count, a: &characters, permutations: &permutations)
        
        for permutation in permutations {
            
            if permutation > original {
                
                if maximumValuePermutation == nil {
                    
                    maximumValuePermutation = permutation
                }
                else if maximumValuePermutation! > permutation {
                    
                    maximumValuePermutation = permutation
                }
            }
        }
        
        return maximumValuePermutation!
    }
    
     static func permutationGreaterThanOrginalAlt(original: String) -> String {
        
        guard original != String(original.reversed()) else {
            
            return "no answer"
        }
        
        var characters = original.map{String($0)}
        
        var permutations = [String]()
        
        BiggerIsGreater.possiblePermutations(n: characters.count, a: &characters, permutations: &permutations)
        
        let sortedPermutations = permutations.filter{$0 > original}.sorted{$1 > $0}
        
        if sortedPermutations.count > 0 {
            
            return sortedPermutations[0]
        }
        else {
            
            return "no answer"
        }
    }
    
    // MARK: Alt
    
     static func possiblePermutationsAlt(n:Int, a:inout [String], original: String, greaterValue: inout String?) {
        
        if n == 1 {
            
            let permutation = a.joined(separator: "")
            
            if permutation > original {
                
                if greaterValue == nil {
                    
                    greaterValue = permutation
                }
                else if greaterValue! > permutation {
                    
                    greaterValue = permutation
                }
            }
            
            return
        }
        
        for i in 0..<n-1 {
            
            possiblePermutationsAlt(n: n-1, a: &a, original: original, greaterValue: &greaterValue)
            
            a.swapAt(n-1, (n%2 == 1) ? 0 : i)
        }
        
        possiblePermutationsAlt(n: n-1, a: &a, original: original, greaterValue: &greaterValue)
    }


}
