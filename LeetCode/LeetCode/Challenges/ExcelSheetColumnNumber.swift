//
//  ExcelSheetColumnNumber.swift
//  LeetCode
//
//  Created by William Boles on 22/02/2022.
//

import Foundation

//https://leetcode.com/problems/excel-sheet-column-number/
//string
struct ExcelSheetColumnNumber {
    
    //Time: O(n) where `n` is number of characters in `columnTitle`
    //Space: O(1)
    //dictionary
    //encoding
    //
    //Solution Description:
    //Treating the alphabet as base 26, we iterate through `columnTitle` in reverse and multiple the value of each character by the position of
    //that character in the string to get it's base 26 value. We then add those values together to get the total value
    static func titleToNumberDic(_ columnTitle: String) -> Int {
        let alphabet: [Character: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
        
        var base = 1
        var num = 0
        
        for c in columnTitle.reversed() {
            let val = alphabet[c]!
            
            num += (val * base)
            base *= 26 //treat the alphabet as base 26 encoding
        }
        
        return num
    }
    
    //Time: O(n) where `n` is number of characters in `columnTitle`
    //Space: O(1)
    //ASCII
    //encoding
    //
    //Solution Description:
    //Treating the alphabet as base 26, we iterate through `columnTitle` in reverse and multiple the value of each character by the position of
    //that character in the string to get it's base 26 value. We then add those values together to get the total value
    static func titleToNumber(_ columnTitle: String) -> Int {
        var base = 1
        var num = 0
        
        for c in columnTitle.reversed() {
            let val = Int(c.asciiValue! - 64) // `A` is 65 on the ASCII table
            
            num += (val * base)
            base *= 26 //treat the alphabet as base 26 encoding
        }
        
        return num
    }
}
