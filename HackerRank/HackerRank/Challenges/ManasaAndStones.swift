// Created 10/05/2016.

import Foundation

//https://www.hackerrank.com/challenges/manasa-and-stones/problem
final class ManasaAndStones {

     static func possibleValuesForFinalStone(numberOfStones: Int, gapValueA: Int, gapValueB: Int) -> Set<Int> {

        var multiplesOfA = (numberOfStones - 1)
        var multiplesOfB = 0
        
        var possibleValues = Set<Int>()
        
        while multiplesOfA >= 0 {
            
            let total = (multiplesOfA * gapValueA) + (multiplesOfB * gapValueB)
            
            possibleValues.insert(total)
            
            multiplesOfA -= 1
            multiplesOfB += 1
        }
    
        return possibleValues
    }
}
