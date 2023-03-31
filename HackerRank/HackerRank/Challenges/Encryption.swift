//
//  Encryption.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/encryption
final class Encryption {

     static func encrypt(originalString: String) -> String {
        var rowsCount = Int(floor(sqrt(Double(originalString.count))))
        let columnsCount = Int(ceil(sqrt(Double(originalString.count))))

        if originalString.count > rowsCount * columnsCount {
            rowsCount += 1
        }

        var grid = [[String]]()

        for rowIndex in 0..<rowsCount {
            var row = [String]()

            let start = rowIndex * columnsCount
            let end = start + columnsCount

            let startRange = originalString.index(originalString.startIndex, offsetBy: start)

            var endRange = originalString.endIndex

            if originalString.count > end {
                endRange = originalString.index(originalString.startIndex, offsetBy: end)
            }

            let substring = originalString[startRange..<endRange]

            for character in substring {
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
