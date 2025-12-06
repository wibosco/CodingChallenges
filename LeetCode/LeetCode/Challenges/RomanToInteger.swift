// Created 08/11/2021.

import Foundation

//https://leetcode.com/problems/roman-to-integer/
struct RomanToInteger {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //The key insight here is that with roman numerals the previous value/digit should never be smaller than the current
    //value/digit. If it is smaller then an individual value but a "compound" value that needs to be combined with the
    //current value to get the actual value e.g. "IV", the "I" is less than the "V" which means that the "I" isn't valid
    //in this context on its own but instead needs to be combined with the "V" to give us "4" rather than "15".
    //
    //So we can use this property of roman numerals to iterate through `s` from left-to-right and convert each character
    //into the decimal system. This converted decimal value we can then just add directly to our running total - `total`.
    //If we discover on the next conversion that actually the previous conversion is of a lesser value then we remove the
    //lesser value from `total` twice - once to remove the false addition and the next removal to remove it from the current
    //decimal conversion value e.g. for "IV" we first added 1 to `total` then we encountered the "V" so we need to remove
    //that false addition which results in `total` == `0` and then remove another 1 before we apply the "V" so that rather
    //than increasing `total` by 5 we correctly increase it by 4 (`IV` == 4).
    func romanToInt(_ s: String) -> Int {
        let mapping: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        let characters = Array(s) //O(n)
        
        var total = mapping[characters[0]]!
        
        for index in 1..<characters.count {
            let currentValue = mapping[characters[index]]!
            let previousValue = mapping[characters[(index - 1)]]!
            
            if currentValue > previousValue {
                // Need to remove the previous falsely added value and then the current values substitution
                // Think about IX (9), we previously added 1 and now we have a current value of X (10) in
                // order to get the correct value of 9 we need to remove 1 twice
                total -= (2 * previousValue)
            }
            
            total += currentValue
        }
        
        return total
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //`I`, `X`, and `C` can modify the value that comes after them so as we iterate through `s`, when one of those three
    //characters are encountered we peek ahead to see the value of that chracter will be positive or negative so that
    //`sum` can be updated accordingly. For all other characters we convert them their int partner and add that to `sum`.
    //Once all values have been converted we return `sum`.
    func romanToInt2(_ s: String) -> Int {
        let singleMapping: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        let doubleMapping: [String: Int] = [
            "IV": 4,
            "IX": 9,
            "XL": 40,
            "XC": 90,
            "CD": 400,
            "CM": 900
        ]
        
        let chars = Array(s) //O(n)
        var sum = 0
        var p1 = 0

        while p1 < chars.count {
            let p2 = p1 + 1
            if p2 < chars.count {
                let double = "\(chars[p1])\(chars[p2])"
                if let value = doubleMapping[double] {
                    sum += value
                    p1 += 2
                    
                    continue
                }
            }
            
            sum += singleMapping[chars[p1]]!

            p1 += 1
        }

        return sum
    }

    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //dictionary
    //
    //Solution Description:
    //`I`, `X`, and `C` can modify the value that comes after them so as we iterate through `s`, when one of those three
    //characters are encountered we peek ahead to see the value of that chracter will be positive or negative so that
    //`sum` can be updated accordingly. For all other characters we convert them their int partner and add that to `sum`.
    //Once all values have been converted we return `sum`.
    func romanToInt3(_ s: String) -> Int {
        let mapping: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        let chars = Array(s) //O(n)
        var sum = 0
        var p1 = 0

        while p1 < chars.count {
            if chars[p1] == "I" {
                let val = mapping[chars[p1]]!
                p1 += 1
                if p1 < chars.count && (chars[p1] == "V" || chars[p1] == "X") {
                    sum -= val
                } else {
                    sum += val
                }
            } else if chars[p1] == "X" {
                let val = mapping[chars[p1]]!
                p1 += 1
                if p1 < chars.count && (chars[p1] == "L" || chars[p1] == "C" ) {
                    sum -= val
                } else {
                    sum += val
                }
            } else if chars[p1] == "C" {
                let val = mapping[chars[p1]]!
                p1 += 1
                if p1 < chars.count && (chars[p1] == "D" || chars[p1] == "M") {
                    sum -= val
                } else {
                    sum += val
                }
            } else {
                sum += mapping[chars[p1]]!

                p1 += 1
            }
        }

        return sum
    }
}
