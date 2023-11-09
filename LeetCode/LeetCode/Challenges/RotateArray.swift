//
//  RotateArray.swift
//  LeetCode
//
//  Created by William Boles on 17/07/2023.
//

import Foundation

//https://leetcode.com/problems/rotate-array/
struct RotateArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //modulo
    //two pointers
    //
    //Solution Description:
    //To avoid having to use extra memory we can think of the rotated `nums` as having two partitions - the right-shifted
    //partition and the wrapped-around partition. In the final rotated array the right-shifted partition will start from `k`
    //to `nums.count -1`; the wrapped-around partition will start from 0 to `k - 1`. The first step to creating these
    //rotated partitions is to reverse the elements in `nums` so that the elements of `nums` are in the right partition -
    //albeit not at the right indexes. Next treating `k` as the pivot point we reverse the order of each partition which
    //shifts each element into it's correct index.
    //
    //N.B. If `k` is actually larger than `nums.count` by performing a modulo operation we will actually "scope" `k` to the
    //range of `nums` e.g.
    //
    //nums = [1, 2, 3]
    //k = 8
    //
    //if we apply the 8 shifts right then what we end up with is:
    //
    //nums = [2, 3, 1]
    //
    //which is the same as if we shifted right 2 which in turn is k % nums.count. so instead of 8 shifts we only need to
    //perform 2.
    static func rotate(_ nums: inout [Int], _ k: Int) {
        reverse(&nums, 0, (nums.count - 1))
        reverse(&nums, 0, (k % nums.count) - 1) //sort wrapped-around partition
        reverse(&nums, (k % nums.count), (nums.count - 1)) //sort right-shifted partition
    }
    
    private static func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left
        var right = right
        
        while left < right {
            let tmp = nums[left]
            nums[left] = nums[right]
            nums[right] = tmp
            
            left += 1
            right -= 1
        }
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //modulo
    //
    //Solution Description:
    //Using an additional array `rotatedNums` we map the elements in `nums` to their k-adjusted indexes in `rotatedNums`. Care
    //needs to be taken to ensure that when an index that is being shifted to the right `k` times goes out-of-bounds of that
    //it is "wrapped" around to the start of `rotatedNums` - we do this with the modulo operation.
    //
    //N.B. If `k` is actually larger than `nums.count` by performing a modulo operation we will actually "scope" `k` to the
    //range of `nums` e.g.
    //
    //nums = [1, 2, 3]
    //k = 8
    //
    //if we apply the 8 shifts right then what we end up with is:
    //
    //nums = [2, 3, 1]
    //
    //which is the same as if we shifted right 2 which in turn is k % nums.count. so instead of 8 shifts we only need to
    //perform 2.
    static func rotateExtraMemory(_ nums: inout [Int], _ k: Int) {
        var rotatedNums = Array(repeating: 0, count: nums.count)

        for (i, num) in nums.enumerated() {
            let rotatedIndex = (i + k) % nums.count //will causing wrapping
            rotatedNums[rotatedIndex] = num
        }
        
        nums = rotatedNums
    }
}
