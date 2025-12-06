// Created 24/02/2024.

import Foundation

//https://leetcode.com/problems/count-pairs-whose-sum-is-less-than-target/
struct CountPairsWhoseSumIsLessThanTarget {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //two pointers
    //
    //Solution Description:
    //First we sort `nums` in ascending order then using two pointers we move through `sortedNums` from both ends. The elements
    //found at `left` and `right` we know will be the smallest and largest individual values respectively. We take the values at
    //`left` and `right`, sum them together and compare that sum against `target`. If `sum` is less than `target` then we know
    //that all combinations from `left`...`right` will also be less than `target` so we increase `count` by that range and move
    //the `left` pointer rightwards. If however `sum` is equal to or greater than `target` then we `right` pointer leftwards and
    //so potenally reduce the `sum` value. We repeat this process until the `left` and `right` pointers cross.
    func countPairs(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted { $0 < $1 }
        
        var count = 0
        
        var left = 0
        var right = sortedNums.count - 1
        
        while left < right {
            let sum = sortedNums[left] + sortedNums[right]
            
            if sum < target {
                count += right - left
                left += 1
            } else {
                right -= 1
            }
        }
        
        return count
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //nested loops
    //
    //Solution Description:
    //First we sort `nums` then we iterate through that sorted array and see how far we can get before `sum` is greater than
    //`target`. Then we move onto the next elements and perform the same search.
    func countPairsNestedLoops(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted { $0 < $1 }
        
        var count = 0
        
        for i in 0..<sortedNums.count {
            for j in (i+1)..<sortedNums.count {
                let sum = sortedNums[i] + sortedNums[j]
                if sum < target {
                    count += 1
                } else {
                    break
                }
            }
        }
        
        return count
    }
}
