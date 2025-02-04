//
//  ConcatenationOfArray.swift
//  LeetCode
//
//  Created by William Boles on 06/07/2023.
//

import Foundation

//https://leetcode.com/problems/concatenation-of-array/
struct ConcatenationOfArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //
    //Solution Description:
    //The elements in `num` should repeat at index `i + n` where `i` is the original index and `n` is the length of `nums`
    func getConcatenation(_ nums: [Int]) -> [Int] {
        return nums + nums
    }
}
