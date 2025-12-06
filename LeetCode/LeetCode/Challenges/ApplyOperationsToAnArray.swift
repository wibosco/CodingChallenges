// Created 11/06/2024.

import Foundation

//https://leetcode.com/problems/apply-operations-to-an-array/
struct ApplyOperationsToAnArray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //three pointers
    //
    //Solution Description:
    //Using three pointers we iterate through `nums`, applying operations as required and gradually building up the `result`
    //array. `p1` points at the index that the result of any operation will be saved at, `p2` points the second index in
    //determining if an operation will be applied and if so the value at `p2` will be set to, `p3` points the next index
    //in `result` that can be overwritten with a non-zero value. Once all elements in `nums` have had an operation applied
    //we need to check if the final element is non-zero and more that value over to `result`.
    func applyOperations(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = Array(repeating: 0, count: nums.count)
        
        var p1 = 0
        var p2 = 1
        var p3 = 0
        
        while p2 < nums.count {
            if nums[p1] == nums[p2] {
                nums[p1] *= 2
                nums[p2] = 0
            }
            
            if nums[p1] > 0 {
                result[p3] = nums[p1]
                p3 += 1
            }
            
            p1 += 1
            p2 += 1
        }
        
        if nums[p1] > 0 {
            result[p3] = nums[p1]
        }
        
        return result
    }
}
