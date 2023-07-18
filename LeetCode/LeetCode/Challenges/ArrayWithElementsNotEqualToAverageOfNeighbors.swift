//
//  ArrayWithElementsNotEqualToAverageOfNeighbors.swift
//  LeetCode
//
//  Created by William Boles on 18/07/2023.
//

import Foundation

//https://leetcode.com/problems/array-with-elements-not-equal-to-average-of-neighbors/
//array
struct ArrayWithElementsNotEqualToAverageOfNeighbors {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(1)
    //greedy
    //sorting
    //
    //Solution Description:
    //An average of two distinct numbers is always greater than the minimum of the two numbers and less than the maximum of the two numbers
    //i.e. it sits exactly in the middle of the two numbers. Therefore to avoid the neighbors of an element resulting in tht element being
    //the average we need to make those neighbors either both larger than the element or both smaller than the element. By sorting `nums`
    //we can build up the `rearranged` array by alternating whether we select a larger or smaller element to place at a given index so
    //ensuring that each elements neighbors will either both be larger or both be smaller i.e. `[large, small, large, small, large, small]`.
    static func rearrangeArray(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        
        var rearranged = [Int]()
        
        var left = 0
        var right = nums.count - 1
        
        for i in 0..<nums.count {
            let num: Int
            if i % 2 == 0 {
                num = nums[left]
                left += 1
            } else {
                num = nums[right]
                right -= 1
            }
            
            rearranged.append(num)
        }
        
        return rearranged
    }
}
