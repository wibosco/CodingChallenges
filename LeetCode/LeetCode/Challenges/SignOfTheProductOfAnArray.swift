//
//  SignOfTheProductOfAnArray.swift
//  LeetCode
//
//  Created by William Boles on 14/07/2023.
//

import Foundation

//https://leetcode.com/problems/sign-of-the-product-of-an-array/
struct SignOfTheProductOfAnArray {
    
    //Time: O(n) where n is the number of characters in `nums`
    //Space: O(1)
    //array
    //modulo
    //
    //Solution Description:
    //Iterating through `nums` we count the number of negative numbers that we encounter - if the count is odd then we know that
    //the product produced will be negative, if the count is even we know the product will be positive. A special case if we
    //encounter a zero, then we instantly return zero, as anything multiplied by zero will always be zero.
    static func arraySign(_ nums: [Int]) -> Int {
        var negatives = 0
        for num in nums {
            guard num != 0 else {
                return 0
            }

            guard num < 0 else {
                continue
            }

            negatives += 1
        }

        return ((negatives % 2) == 0) ? 1 : -1
    }
}
