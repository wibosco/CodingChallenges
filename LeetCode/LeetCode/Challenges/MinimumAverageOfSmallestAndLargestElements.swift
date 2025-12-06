// Created 30/08/2024.

import Foundation

//https://leetcode.com/problems/minimum-average-of-smallest-and-largest-elements/
struct MinimumAverageOfSmallestAndLargestElements {
  
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //
    //Solution Description:
    //First we sort `nums` in ascending order then using two pointers, one at either end of the sorted array, we calculate the
    //average of those two numbers and compare that `average` against `smallest`. If the `average` is smaller than `smallest`
    //we replace `smallest` with the `average`. Then we move the two pointer towards each other and repeat the process. Once
    //`left` and `right` cross we know that there are no more averages to calculate and can then return `smallest` as the
    //result.
    func minimumAverage(_ nums: [Int]) -> Double {
        var smallest = Double.infinity
        let sortedNums = nums.sorted()
        
        var left = 0
        var right = sortedNums.count - 1
        
        while left < right {
            let v1 = Double(sortedNums[left])
            let v2 = Double(sortedNums[right])
            
            let average = (v1 + v2) / 2
            smallest = min(smallest, average)
            
            left += 1
            right -= 1
        }
        
        return smallest
    }
}
