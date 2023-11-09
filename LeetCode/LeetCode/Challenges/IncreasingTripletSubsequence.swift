//
//  IncreasingTripletSubsequence.swift
//  LeetCode
//
//  Created by William Boles on 08/04/2023.
//

import Foundation

//https://leetcode.com/problems/increasing-triplet-subsequence
struct IncreasingTripletSubsequence {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //greedy
    //
    //Solution Description:
    //It's important to note that when finding this subsequence the elements not need to be contiguous so what we are trying to
    //find is just any elements that follow on from each where each element increases - not that the order is important. To do
    //this we need to track two - `small` and `medium` (no need to track `large` as finding `large` means we have our
    //subsequence and can return true). As we iterate through `nums` we compare the current element against `small` and `medium`.
    //First we are only interested in `small` then once that have a value we include `medium` and once `medium` has a value we
    //include `large`. It's important to note that we want the best version of `small` and `medium` so if we encounter smaller
    //elements that fit those roles, we replace the current value with that smaller value and so increase our chances of finding
    //a triplet.
    static func increasingTriplet(_ nums: [Int]) -> Bool {
        var small = Int.max
        var medium = Int.max

        for num in nums {
            if num < small {
                small = num
            } else if num > small && num < medium {
                medium = num
            } else if num > medium {
                return true
            }
        }

        return false
    }
}
