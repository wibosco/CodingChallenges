//
//  ValidPalindrome.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/valid-palindrome/
struct ValidPalindrome {
    
    //Time: O(n)
    //two pointers
    func isPalindrome(_ s: String) -> Bool {
        let str = s.lowercased().filter { $0.isLetter || $0.isNumber }
        let characters = Array(str)
        
        var left = 0
        var right = characters.count - 1
        
        while right >= left {
            if characters[left] != characters[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}
 
