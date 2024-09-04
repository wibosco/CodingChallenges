//
//  SortTransformedArray.swift
//  LeetCode
//
//  Created by William Boles on 04/09/2024.
//

import Foundation

//https://leetcode.com/problems/sort-transformed-array/
struct SortTransformedArray {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //
    //Solution Description:
    //We apply the forumla to each element in `nums`, add the outcome to the `result` array and sort that array.
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        var result = [Int]()
        
        for num in nums {
            let outcome = (a * (num * num)) + (b * num) + c
            result.append(outcome)
        }
        
        return result.sorted()
    }
}
