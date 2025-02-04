//
//  FindPivotIndex.swift
//  LeetCode
//
//  Created by William Boles on 07/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-pivot-index/
//array
struct FindPivotIndex {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //prefix sum
    //
    //Solution Description:
    //First we calculate the total sum of all elements in `nums` and store that in `rightSum`. We then iterate through `nums`
    //again this time subtracting the current `num` value from `rightSum` and then comparing that update `rightSum` against
    //`leftSum` - note that we don't yet add `num` to `leftSum`. If those two value are equal then we have found the pivot
    //index and can return `i`; if they are not equal we add `num` to `leftSum` and continue iterating. If have iterated
    //through all elements in `nums` we haven't found the pivot index we return `-1`.
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftSum = 0
        var rightSum = 0
        
        for num in nums {
            rightSum += num
        }
        
        for (i, num) in nums.enumerated() {
            rightSum -= num
            
            if leftSum == rightSum {
                return i
            }
            
            leftSum += num
        }
        
        return -1
    }
}
