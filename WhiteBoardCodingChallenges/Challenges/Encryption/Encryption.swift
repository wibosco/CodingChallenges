//
//  Encryption.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/encryption
class Encryption: NSObject {

    class func encrypt(originalString: String) -> String {
        
        var rowsCount = Int(floor(sqrt(Double(originalString.characters.count))))
        let columnsCount = Int(ceil(sqrt(Double(originalString.characters.count))))
        
        if originalString.characters.count > rowsCount * columnsCount {
            
            rowsCount += 1
        }
        
        var grid = [[String]]()
        
        for rowIndex in 0..<rowsCount {
            
            var row = [String]()
            
            let start = rowIndex * columnsCount
            let end = start + columnsCount
            
            let startRange = originalString.characters.startIndex.advancedBy(start)
            
            var endRange = originalString.characters.endIndex
            
            if originalString.characters.count > end {
                
                endRange = originalString.characters.startIndex.advancedBy(end)
            }
            
            let substring = originalString.substringWithRange(startRange..<endRange)
            
            for character in substring.characters {
                
                row.append(String(character))
            }
            
            grid.append(row)
        }
        
        var encryptString = ""
        
        for columnIndex in 0..<columnsCount {
            
            for rowIndex in 0..<rowsCount {
                
                let row = grid[rowIndex]
                
                if row.count > columnIndex{
                    
                    encryptString += grid[rowIndex][columnIndex]
                }
            }
            
            if columnIndex != (columnsCount - 1) {
                
                encryptString += " "
            }
        }
        
        return encryptString
    }
}
