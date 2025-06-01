// Created 01/06/2025.

import Foundation

//https://leetcode.com/problems/consecutive-characters/
struct ConsecutiveCharacters {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //Effectively using two pointers we iterate through `s` and compare the characters at each pointer against each other. If
    //the characters match we increment `current` if the characters don't match we set `current` to 1 as we have found a new
    //pattern. Each iteration we compare `current` against `power` and set `power` to the higher value. Once all characters
    //in `s` have been compared we return `power`.
    func maxPower(_ s: String) -> Int {
        var power = 1
        let chars = Array(s)
        
        var current = 1
        var i = 1
        while i < chars.count {
            if chars[i] == chars[(i - 1)] {
                current += 1
            } else {
                current = 1
            }

            power = max(power, current)

            i += 1
        }

        return power
    }
}
