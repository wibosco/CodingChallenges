//
//  CavityMap.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/cavity-map
class CavityMap: NSObject {
    
    class func generateCavityMap(map: [String]) -> [String] {
        
        let cavity = "X"
        
        var cavityMap = map
        
        if map.count > 2 {
            
            for rowIndex in 1..<(cavityMap.count - 1) {
                
                let row = cavityMap[rowIndex]
                
                var cavityRow = row
                
                for cellIndex in cavityRow.characters.indices {
                    
                    if cellIndex != cavityRow.characters.startIndex && cellIndex != cavityRow.characters.endIndex.advancedBy(-1) {
                        
                        let cell = String(cavityRow.characters[cellIndex])
                        
                        let previousCellInRow = String(cavityRow.characters[cellIndex.advancedBy(-1)])
                        let nextCellInRow = String(cavityRow.characters[cellIndex.advancedBy(1)])
                        
                        let previousRow = cavityMap[(rowIndex - 1)]
                        let nextRow = cavityMap[(rowIndex + 1)]
                        
                        let cellInPreviousRow = String(previousRow.characters[cellIndex])
                        let cellInNextRow = String(nextRow.characters[cellIndex])
                        
                        if !(cell == cavity || previousCellInRow == cavity || nextCellInRow == cavity || cellInPreviousRow == cavity || cellInNextRow == cavity) {
                            
                            if Int(cell) > Int(previousCellInRow) && Int(cell) > Int(nextCellInRow) && Int(cell) > Int(cellInPreviousRow) && Int(cell) > Int(cellInNextRow){
                                
                                cavityRow.replaceRange(cellIndex..<cellIndex.advancedBy(1), with: cavity)
                            }
                        }
                    }
                }
                
                cavityMap[rowIndex] = cavityRow
            }

        }
        
        return cavityMap
    }
}
