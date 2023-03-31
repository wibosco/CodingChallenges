//
//  GridSearch.swift
//  HackerRank
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/the-grid-search
final class GridSearch {

     static func gridContainsPattern(grid: [String], pattern: [String]) -> Bool {
     
        for index in 0..<grid.count {
            
            let row = grid[index]
            
            if grid.count >= (index + pattern.count) {
                
                if row.contains(pattern[0]) {
                    
                    let rangesOfFirstPattern = GridSearch.rangeOfAllOccurrancesOfPatternInRow(row: row, pattern: pattern[0])
                    
                    let newPattern = pattern[1..<pattern.count].map{$0}
                    let newGrid = grid[(index+1)..<grid.count].map{$0}
                    
                    for range in rangesOfFirstPattern {
                        
                        if GridSearch.doesContainPatternMatchingRange(grid: newGrid, pattern: newPattern, range: range) {
                            
                            return true
                        }
                    }
                }
            }
        }
        
        return false
    }
    
     static func doesContainPatternMatchingRange(grid: [String], pattern: [String], range: Range<String.Index>) -> Bool {
        let patternRange = grid[0].range(of: pattern[0], options: NSString.CompareOptions.caseInsensitive, range: range, locale: nil)
        
        if patternRange != nil {
            
            let newPattern = pattern[1..<pattern.count].map{$0}
            let newGrid = grid[1..<grid.count].map{$0}
            
            if newPattern.count > 0 {
            
                return GridSearch.doesContainPatternMatchingRange(grid: newGrid, pattern: newPattern, range: range)
            }
            else {
                
                return true
            }
        }
        
        return false
    }
    
     static func rangeOfAllOccurrancesOfPatternInRow(row: String, pattern: String) -> [Range<String.Index>] {
        
        var occurrances = [Range<String.Index>]()
        
        if row.contains(pattern) {
            let patternCharacterCount = pattern.count
            let limit = row.endIndex
            for index in row.indices {
                guard let upperLimit = row.index(index, offsetBy: patternCharacterCount, limitedBy: limit) else {
                    break
                }
                
                let range = index..<upperLimit
                let patternRange = row.range(of: pattern, options: .caseInsensitive, range:range, locale: nil)

                if let patternRange = patternRange {
                    occurrances.append(patternRange)
                }
            }
        }

        return occurrances
    }
}
