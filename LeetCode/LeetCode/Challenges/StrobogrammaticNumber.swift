//
//  StrobogrammaticNumber.swift
//  LeetCode
//
//  Created by William Boles on 02/09/2024.
//

import Foundation

//https://leetcode.com/problems/strobogrammatic-number/
struct StrobogrammaticNumber {
    
    //Time: O(n) where n is the number of characters in `num`
    //Space: O(n)
    //string
    //array
    //two pointers
    //dictionary
    //
    //Solution Description:
    //First we build a dictionary mapping the each strobogrammatic character to it's partner. Then using two pointers we
    //iterate through `num`, going from out to in. With each iteration we check that the characters found are strobogrammatic
    //to each other - if they are not we return false, else we continue with the iteration. If all characters in `nums` have
    //been checked we return true.
    func isStrobogrammatic(_ num: String) -> Bool {
        let pairs: [Character: Character] = ["9": "6",
                                             "6": "9",
                                             "0": "0",
                                             "1": "1",
                                             "8": "8"]
        
        let chars = Array(num)
        
        var left = 0
        var right = chars.count - 1
        
        while left <= right {
            guard let partner = pairs[chars[left]], partner == chars[right] else {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
