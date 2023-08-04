//
//  NextPermutationNumber.swift
//  LeetCode
//
//  Created by William Boles on 14/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/next-permutation/
struct NextPermutation {
    
    //Time: O(n) - Don't be tricked by the for inside a for, notice the breaks
    //Space: O(1)
    //array
    //two pointers
    //inline
    //
    //Solution Description:
    //In order to find the next larger permutation we need to the smallest unit index (indexing from the right) that
    //has a larger value than the index directly to its right - this becomes our pivot index (if this doesn't exist
    //then we have the highest value premutation and should return the lowest possible permutation i.e. all in
    //ascending order). We then need to switch out this pivot with the smallest unit index that has a larger value
    //than the pivots value - please note that we only switch out one index. Finally having switched out the pivot
    //we then just need to ensure that everything after the pivot is the smallest it can be by sorting it in ascending
    //order.
    //
    //See: https://www.youtube.com/watch?v=quAS1iydq7U&t=1s
    static func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var pivot = -1 //so if no pivot is found the whole array will be sorted in ascending order
        //ls - less significant index
        //ms = more significant index i.e. one to the right
        for ls in (1..<nums.count).reversed() {
            let ms = ls - 1
            if nums[ls] > nums[ms] {
                pivot = ms
                let insidePivot = (pivot + 1)
                for index in (insidePivot..<nums.count).reversed() {
                    if nums[index] > nums[pivot] {
                        nums.swapAt(pivot, index)
                        break
                    }
                }
                break
            }
        }
        
        nums[(pivot + 1)...].reverse()
    }
    
    //Time: O(n)
    //two pointers
    //array
    //
    //See: https://www.youtube.com/watch?v=quAS1iydq7U&t=1s
    static func nextPermutationAlt(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        //find smallest index where the less-significant index is larger than the more-significant index
        var pivot: Int?
        for ls in (1..<nums.count).reversed() {
            let ms = ls - 1
            if nums[ls] > nums[ms] {
                pivot = ms
                break
            }
        }
        
        //if we didn't find our pivot, then there is no larger permutation
        if let pivot = pivot {
            //sort everything to the right of the pivot (least-significant) into ascending order and then swap the
            //pivot for the first (smallest) value that is greater than itself
            let insidePivot = (pivot + 1)
            let sortRange = insidePivot..<nums.count
            let sorted = nums[sortRange].sorted()
            nums.replaceSubrange(sortRange, with: sorted)
            
            for index in insidePivot..<nums.count {
                if nums[index] > nums[pivot] {
                    nums.swapAt(pivot, index)
                    return
                }
            }
        }
        
        nums.sort()
    }
}
