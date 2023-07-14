//
//  LargestNumber.swift
//  LeetCode
//
//  Created by William Boles on 13/07/2023.
//

import Foundation

//https://leetcode.com/problems/largest-number/
//array
struct LargestNumber {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //greedy
    //string
    //sorting
    //
    //Solution Description:
    //To construct the largest number, we want to ensure that the most significant digits are occupied by the largest
    //digits. First we convert each element in `nums` into a String instance then we sort those strings using a custom
    //sorting. We first two elements in `str` and combine them to form the two possible ordering, these orderings are
    //then compared with the larger of the two orderings being sorted first. The sorting is the greedy part as we don't
    //know if the two elements being sorted will endup together and so actually form that pair but that's ok we just take
    //the local larger ordering and repeat the process until all elements are sorted into their final positions. Before
    //returning we check for an edge case where `strs` consists of zeros - if it does we return just one zero; else we
    //join the elements in `strs` and return.
    static func largestNumber(_ nums: [Int]) -> String {
        var strs = nums.map { String($0) }
        strs.sort { ($0 + $1) > ($1 + $0) }
        
        return strs.first == "0" ? "0" : strs.joined()
    }
}
