//
//  NextPermutationNumber.swift
//  CodingChallenges
//
//  Created by William Boles on 14/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/next-permutation/
//two pointers
//arrays
//see https://www.youtube.com/watch?v=quAS1iydq7U&t=1s
struct NextPermutationNumber {
    
    //O(n) - Don't be tricked by the for inside a for, notice the breaks
    static func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var pivot = -1
        //find smallest index where the less-significant index
        //is larger than the more-significant index as this value
        //will allow us to create the next permutation. A descending
        //order sequence e.g '7, 5, 3, 2, 1' means that all that
        //those numbers are already on their last permutstion.
        for ls in (1..<nums.count).reversed() {
            let ms = ls - 1
            if nums[ls] > nums[ms] {
                pivot = ms
                //We know everything up to the pivot from the end was
                //in descending order from (right to left) so to swap
                //the pivot for the first (smallest) value that is
                //greater than itself we need to reverse the array
                //and compare
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
        
        //As we have changed to pivot we now need to calculate
        //the smallest permutation with that new pivot. Thankfully
        //this is just an ascending order of those values to the
        //right of the pivot (opposite process of how we found
        //the pivot)
        nums[(pivot + 1)...].reverse()
    }
    
    //O(n)
    static func nextPermutationAlt(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        //find smallest index where the less-significant index
        //is larger than the more-significant index
        var pivot: Int?
        for ls in (1..<nums.count).reversed() {
            let ms = ls - 1
            if nums[ls] > nums[ms] {
                pivot = ms
                break
            }
        }
        
        //if we didn't find our pivot, then there is no larger
        //permutation
        if let pivot = pivot {
            //sort everything to the right of the pivot (least-
            //significant) into ascending order and then swap
            //the pivot for the first (smallest) vslue that is
            //greater than itself
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
