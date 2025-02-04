//
//  MinimumDifferenceBetweenHighestAndLowestOfKScore.swift
//  LeetCode
//
//  Created by William Boles on 16/07/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
struct MinimumDifferenceBetweenHighestAndLowestOfKScore {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sliding window
    //sorting
    //intervals
    //
    //Solution Description:
    //Treating this as an intervals problem we first sort the array so that one of the neighbors of an element is the smallest
    //difference possible in `nums` - this means that we don't need to produce all subsequences of `nums` to get to find
    //those smallest differences. We can then use a sliding window of size `k` to iterate through `nums`, calculating the
    //difference between the minimum and maximum value and comparing that with the minimum difference found so far. As `nums`
    //has been sorted the minimum and maximum value will the the first and last element in the subarray. After iterating
    //through all elements in `nums` we return `minDiff`.
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        let nums = nums.sorted()

        var minDiff = Int.max
            
        var left = 0
        var right = (k - 1)
        
        while right < nums.count {
            let diff = nums[right] - nums[left]
            minDiff = min(minDiff, diff)
            
            left += 1
            right += 1
        }

        return minDiff
    }
    
    //Time: O(n^2) where n is the number of elements in `s`
    //Space: O(n)
    //array
    //subsequence
    //DFS
    //recursive
    //recursive-returning
    //backtracking
    //array
    //multi-source
    //n-ary tree
    //
    //Solution Description:
    //Using DFS we produce all subsequences of `nums`, keeping tracking of the minimum and maximum values encountered in that
    //subsequence. If that subsequence grows to include `k` elements we calculate the difference between that maximum and minimum
    //value and return it else we abandon that subsequence. If the difference of that subsequence is returned we compare it
    //against the minimum difference found across all subsequences so far. Once we have produced all subsequences we return that
    //minimum difference.
    func minimumDifferenceSubsequenceReturning(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var minDiff = Int.max
        
        for i in 0..<nums.count {
            let diff = dfs(nums, i, (k - 1), nums[i], nums[i])
            minDiff = min(minDiff, diff)
        }
        
        return minDiff
    }
    
    private func dfs(_ nums: [Int], _ index: Int, _ k: Int, _ minValue: Int, _ maxValue: Int) -> Int {
        guard k > 0 else {
            return maxValue - minValue
        }
        
        guard index < nums.count else {
            return Int.max
        }
        
        var minDiff = Int.max
        for i in (index + 1)..<nums.count {
            let newMinValue = min(minValue, nums[i])
            let newMaxValue = max(maxValue, nums[i])
            
            let diff = dfs(nums, i, (k - 1), newMinValue, newMaxValue)
            
            minDiff = min(minDiff, diff)
        }
        
        return minDiff
    }
    
    //Time: O(n^2) where n is the number of elements in `s`
    //Space: O(n)
    //array
    //subsequence
    //DFS
    //recursive
    //recursive-inout
    //backtracking
    //array
    //multi-source
    //n-ary tree
    //
    //Solution Description:
    //Using DFS we produce all subsequences of `nums`, keeping tracking of the minimum and maximum values encountered in that
    //subsequence. If that subsequence grows to include `k` elements we calculate the difference between that maximum and minimum
    //value and return it else we abandon that subsequence. If the difference of that subsequence is returned we compare it
    //against the minimum difference found across all subsequences so far. Once we have produced all subsequences we return that
    //minimum difference.
    func minimumDifferenceSubsequenceInOut(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var minDiff = Int.max
        
        for i in 0..<nums.count {
            dfs(nums, i, (k - 1), nums[i], nums[i], &minDiff)
        }
        
        return minDiff
    }
    
    private func dfs(_ nums: [Int], _ index: Int, _ k: Int, _ minValue: Int, _ maxValue: Int, _ minDiff: inout Int) {
        guard k > 0 else {
            let diff = maxValue - minValue
            minDiff = min(minDiff, diff)

            return
        }

        guard index < nums.count else {
            return
        }

        for i in (index + 1)..<nums.count {
            let newMinValue = min(minValue, nums[i])
            let newMaxValue = max(maxValue, nums[i])

            dfs(nums, i, (k - 1), newMinValue, newMaxValue, &minDiff)
        }
    }
}
