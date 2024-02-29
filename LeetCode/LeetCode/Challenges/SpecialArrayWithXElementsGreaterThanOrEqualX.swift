//
//  SpecialArrayWithXElementsGreaterThanOrEqualX.swift
//  LeetCode
//
//  Created by William Boles on 29/02/2024.
//

import Foundation

//https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/
struct SpecialArrayWithXElementsGreaterThanOrEqualX {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //binary search
    //less than binary search
    //
    //Solution Description:
    //First we sort `nums` in ascending order then looping through a loop of `sortedNums.count` iteration we attempt to find
    //an index `i` that results in `i` elements being than itself. We use binary search to find the right-most index that is
    //than `i` as we can then quickly calculate that anything to the right is greater than or equal to `i`. If the `greater
    //than or equal to` count matches `i`, then we have our "special array" and can return `i`; if `i` isn't matched then
    //we iterate again. If after iterating through all of `1...sortedNums.count` we haven't found a match we return -1.
    func specialArray(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted(by: <)
        
        for i in 1...sortedNums.count {
            let index = lessThanBinarySearch(sortedNums, i) + 1 // start on the greater than or equal to index
            
            if (sortedNums.count - index) == i {
                return i
            }
        }
        
        return -1
    }
    
    private func lessThanBinarySearch(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count  - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] < target {
                left = mid + 1
                result = mid
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
