//
//  FindPivotIndex.swift
//  LeetCode
//
//  Created by William Boles on 07/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-pivot-index/
struct FindPivotIndex {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
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
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //prefix sum
    //
    //Solution Description:
    //First we build up a prefix sum array going from rightwards (0..<n) with the calculated sum at each index being store
    //for the managing index. Next we repeat this process going leftwards ((n - 1)...0). Now that we have two prefix sum
    //arrays we iterate through `nums` again, this time comparing the prefix sums from each array at either side of the
    //current `nums` index so `forwardPrefix` is checked at `i - 1` and `backwardPrefix` is checked at `i + 1` as the
    //values at those indexes show the pre or post sum from `i`. If those values match we have found the pivot; if those
    //values don't match we move onto the next iteration and repeat the process. If having processed all elements in
    //`nums` we haven't found a pivot, we return -1.
    func pivotIndex2(_ nums: [Int]) -> Int {
        var prefix = 0

        var forwardPrefix = Array(repeating: 0, count: nums.count)
        
        for i in 0..<nums.count {
            prefix += nums[i]
            forwardPrefix[i] = prefix
        }

        prefix = 0

        var backwardPrefix = Array(repeating: 0, count: nums.count)

        for i in (0..<nums.count).reversed() {
            prefix += nums[i]
            backwardPrefix[i] = prefix
        }

        for i in 0..<nums.count {
            let preSum = i == 0 ? 0 : forwardPrefix[(i - 1)]
            let postSum = i == (nums.count - 1) ? 0 : backwardPrefix[(i + 1)]

            if preSum == postSum {
                return i
            }
        }

        return -1
    }
}
