//
//  CavityMap.swift
//  CodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/cavity-map
final class CavityMap {
    
     static func generateCavityMap(map: [String]) -> [String] {
        let cavity = "X"
        
        var cavityMap = map
        
        if map.count > 2 {

            for rowIndex in 1..<(cavityMap.count - 1) {
                let row = cavityMap[rowIndex]
                var cavityRow = row

                for cellIndex in cavityRow.indices {
                    if cellIndex != cavityRow.startIndex && cellIndex != cavityRow.index(cavityRow.endIndex, offsetBy: -1) {

                        let cell = String(cavityRow[cellIndex])
                        let previousCellInRow = String(cavityRow[cavityRow.index(cellIndex, offsetBy: -1)])
                        let nextCellInRow = String(cavityRow[cavityRow.index(cellIndex, offsetBy: 1)])
                        
                        let previousRow = cavityMap[(rowIndex - 1)]
                        let nextRow = cavityMap[(rowIndex + 1)]

                        let cellInPreviousRow = String(previousRow[cellIndex])
                        let cellInNextRow = String(nextRow[cellIndex])

                        if !(cell == cavity || previousCellInRow == cavity || nextCellInRow == cavity || cellInPreviousRow == cavity || cellInNextRow == cavity) {
                            if Int(cell)! > Int(previousCellInRow)! && Int(cell)! > Int(nextCellInRow)! && Int(cell)! > Int(cellInPreviousRow)! && Int(cell)! > Int(cellInNextRow)! {
                                let range = cellIndex..<cavityRow.index(cellIndex, offsetBy: 1)
                                cavityRow.replaceSubrange(range, with: cavity)
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
