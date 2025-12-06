// Created 08/11/2021.

import Foundation

//https://leetcode.com/problems/integer-to-roman/
//dictionary
//modulo
struct IntegerToRoman {
    
    //Time: O(n)
    func intToRoman(_ num: Int) -> String {
        let romanNumerals = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"], // Units
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], // Tens
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], // Hundreds
            ["", "M", "MM", "MMM"] // Thousands
        ]
        
        var roman = ""
        var position = 0
        var num = num
        
        while num > 0 {
            let pop = num % 10
            roman = romanNumerals[position][pop] + roman
            
            position += 1
            num /= 10
        }
        
        return roman
    }
}
