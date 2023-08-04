//
//  ContiguousArray.swift
//  LeetCode
//
//  Created by William Boles on 04/02/2022.
//

import Foundation

//https://leetcode.com/problems/contiguous-array/
struct ContiguousArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n) where n is the number of elements in `counts`
    //array
    //prefix sum
    //dictionary
    //
    //Solution Description:
    //Using a twist on the prefix sum technique we iterate through `nums` storing the count of the elements that we encounter
    //as sum. When we encounter `0` we decrement the count and for `1` we increment. We have two scenarios for a contiguous
    //balanced array:
    //
    //1. From the start
    //2. Not from the start
    //
    //Determining a contiguous balanced array from the start (1) is simple enough - if the count has a value of zero then we
    //have our current max length contiguous balanced array (it will always be the max length as we are moving linearly through
    //the array from 0 to `n`). Determining a contiguous balanced array NOT from the start (2) is tricker. Rather than looking
    //for count having a value of zero we want to look for count have a value that we already seen as this shows that from that
    //previous seen index to the current index the `0`s and `1`s are balanced. We can do this by storing the index for that
    //count in a dictionary (N.B. we only show the first index with count as this will result in the longest contiguous
    //balanced array for that count) and then substracting the current index value away from that stored index
    static func findMaxLength(_ nums: [Int]) -> Int {
        var count = 0
        var counts = [Int: Int]()
        var maxLength = 0
        
        for (i, num) in nums.enumerated() {
            if num == 0 {
                count -= 1
            } else {
                count += 1
            }
            
            if count == 0 { //contiguous balanced array starts from index 0
                maxLength = (i + 1)
            } else if let startingIndex = counts[count] { //contiguous balanced array starts from index which is not 0
                maxLength = max(maxLength, (i - startingIndex))
            } else {
                counts[count] = i
            }
        }
        
        return maxLength
    }
}
