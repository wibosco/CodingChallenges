// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/
struct MinimumPairRemovalToSortArrayI {
    
    //Time: O(
    //Space: O(
    //
    //Solution Description:
    //
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var nums = nums
        var count = 0
        while !isNonDecreasing(nums) {
            let pair = findMinimumSumPair(nums)
            nums[pair.0] = pair.2
            nums.remove(at: pair.1)
            
            count += 1
        }
        
        return count
    }
    
    private func findMinimumSumPair(_ nums: [Int]) -> (Int, Int, Int) {
        var minimumSumPair = (0, 1, (nums[0] + nums[1]))
        for x in 2..<nums.count {
            let currentSum = nums[x] + nums[(x - 1)]
            if currentSum < minimumSumPair.2 {
                minimumSumPair = ((x - 1), x, currentSum)
            }
        }
        
        return minimumSumPair
    }
    
    private func isNonDecreasing(_ nums: [Int]) -> Bool {
        for x in 1..<nums.count {
            if nums[x] < nums[(x - 1)] {
                return false
            }
        }
        
        return true
    }
}
