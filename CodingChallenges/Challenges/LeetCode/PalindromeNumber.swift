//
//  PalindromeNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/palindrome-number/
struct PalindromeNumber {
    //O(n)
    static func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }

        guard x > 9 else {
            return true
        }

        var reversedX = 0
        var tmp = x
        while tmp > 0 {
            let pop = tmp % 10
            reversedX *= 10 // make room for the the pop to be added e.g. 123 becomes 1230
            reversedX += pop
            tmp /= 10
        }

        return reversedX == x
    }
}
