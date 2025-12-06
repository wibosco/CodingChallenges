// Created 30/08/2024.

import Foundation

//https://leetcode.com/problems/number-of-distinct-averages/
struct NumberOfDistinctAverages {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //sorting
    //
    //Solution Description:
    //First we sort `nums` in ascending order then using two pointers, one at either end of the sorted array, we calculate the
    //average of those two numbers and add it to the set `distinctAverages`. As `distinctAverages` is a set any duplicates
    //are filtered out. Then we move the two pointers towards each other and repeat the process. Once `left` and `right` cross
    //we know that there are no more averages to calculate and can then return the count of  `distinctAverages` as the result.
    func distinctAverages(_ nums: [Int]) -> Int {
        var distinctAverages = Set<Double>()
        let sortedNums = nums.sorted()
        
        var left = 0
        var right = sortedNums.count - 1
        
        while left < right {
            let v1 = Double(sortedNums[left])
            let v2 = Double(sortedNums[right])
            
            let average = (v1 + v2) / 2
            
            distinctAverages.insert(average)
            
            left += 1
            right -= 1
        }
        
        return distinctAverages.count
    }
}
