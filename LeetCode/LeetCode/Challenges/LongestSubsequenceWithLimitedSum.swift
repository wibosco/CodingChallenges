//
//  LongestSubsequenceWithLimitedSum.swift
//  LeetCode
//
//  Created by William Boles on 25/02/2024.
//

import Foundation

//https://leetcode.com/problems/longest-subsequence-with-limited-sum/
struct LongestSubsequenceWithLimitedSum {
    
    //Time: O(n log n + m log n) where n is the number of elements in `nums`
    //                           where m is the number of elements in `queries`
    //Space: O(n)
    //array
    //sorting
    //prefix sum
    //binary search
    //
    //Solution Description:
    //As we can remove elements from `nums` and the ordering isn't important we first sort `nums` in ascending order and then
    //transform `sortedNums` into a prefix sum array. With an ascending prefxi sum array we can use binary search to find the
    //right-most element that is less than or equal to each `queries` element in turn.
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var prefixSum = [Int]()
        var sum = 0
        let sortedNums = nums.sorted(by: <)
        
        for i in 0..<sortedNums.count {
            let num = sortedNums[i]
            sum += num
            
            prefixSum.append(sum)
        }
        
        var results = [Int]()
        for query in queries {
            let result = binarySearch(prefixSum, query)
            results.append(result)
        }
        
        return results
    }
    
    private func binarySearch(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] <= target {
                left = mid + 1
                result = mid
            } else {
                right = mid - 1
            }
        }
        
        return result + 1
    }
}
