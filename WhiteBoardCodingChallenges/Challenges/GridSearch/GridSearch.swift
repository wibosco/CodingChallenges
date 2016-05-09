//
//  GridSearch.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class GridSearch: NSObject {

    class func gridContainsPattern(grid: [String], pattern: [String]) -> Bool {
     
        for index in 0..<grid.count {
            
            let row = grid[index]
            
            if grid.count >= (index + pattern.count) {
                
                if row.containsString(pattern[0]) {
                    
                    let rangesOfFirstPattern = GridSearch.rangeOfAllOccurrancesOfPatternInRow(row, pattern: pattern[0])
                    
                    let newPattern = pattern[1..<pattern.count].map{$0}
                    let newGrid = grid[(index+1)..<grid.count].map{$0}
                    
                    for range in rangesOfFirstPattern {
                        
                        if GridSearch.doesContainPatternMatchingRange(newGrid, pattern: newPattern, range: range) {
                            
                            return true
                        }
                    }
                }
            }
        }
        
        return false
    }
    
    class func doesContainPatternMatchingRange(grid: [String], pattern: [String], range: Range<String.Index>) -> Bool {
        
        let patternRange = grid[0].rangeOfString(pattern[0], options: NSStringCompareOptions.CaseInsensitiveSearch, range: range, locale: nil)
        
        if patternRange != nil {
            
            let newPattern = pattern[1..<pattern.count].map{$0}
            let newGrid = grid[1..<grid.count].map{$0}
            
            if newPattern.count > 0 {
            
                return GridSearch.doesContainPatternMatchingRange(newGrid, pattern: newPattern, range: range)
            }
            else {
                
                return true
            }
        }
        
        return false
    }
    
    class func rangeOfAllOccurrancesOfPatternInRow(row: String, pattern: String) -> [Range<String.Index>] {
        
        var occurrances = [Range<String.Index>]()
        
        if row.containsString(pattern) {
            
            let patternCharacterCount = pattern.characters.count
            let limit = row.characters.endIndex
            
            for index in row.characters.indices {
                
                let range = index..<index.advancedBy(patternCharacterCount, limit: limit)
                
                let patternRange = row.rangeOfString(pattern, options: NSStringCompareOptions.CaseInsensitiveSearch, range:range, locale: nil)
                
                if let patternRange = patternRange {
                    
                    occurrances.append(patternRange)
                }
            }
        }

        return occurrances
    }
}
