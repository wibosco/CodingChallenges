//
//  NumberOfArithmeticTriplets.swift
//  LeetCode
//
//  Created by William Boles on 06/03/2024.
//

import Foundation

//https://leetcode.com/problems/number-of-arithmetic-triplets/
struct NumberOfArithmeticTriplets {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //As nums is a "strictly increasing integer array" we know that each element is unique and that a smaller number will
    //always come before a larger number. So first we add all the numbers into a set to allow O(1) retrieval time then we
    //loop through each element in `nums` going largest to smallest (could have been the other way round, we would just
    //need to add `diff` rather than subtract it) and calculate the two other values that would need to be in `nums` for
    //this to be an arithmetic triplet - we then check that these values are in `diffs`. Again, as `nums` is sorted the
    //smaller value will have a smaller index so don't actually need to do anything with indexes as it is built into
    //the data structure. If `num` is part of a triplet we increment `tripletsCount`. Once we have iterated through all
    //elements in `num` we return `tripletsCount`.
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var tripletsCount = 0
        
        let diffs = Set<Int>(nums)
        
        for num in nums.reversed() {
            let first = num - diff
            let second = num - (2 * diff) //same as going (first - diff)
            
            if diffs.contains(first) && diffs.contains(second) {
                tripletsCount += 1
            }
        }
        
        return tripletsCount
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //As nums is a "strictly increasing integer array" we know that each element is unique and that a smaller number will
    //always come before a larger number. We use binary search to determine if from any given `nums` element it is the
    //largest value in an arithmetic triplet. With each binary search we perform we reduce the search space by only
    //searching `nums` up to the index of the previous potential arithmetic triplet index.
    func arithmeticTripletsBinarySearch(_ nums: [Int], _ diff: Int) -> Int {
        var tripletsCount = 0
        
        for i in (0..<nums.count).reversed() {
            let num = nums[i]
            let firstTarget = num - diff
            
            guard let nextI = binarySearch(nums, 0, (i - 1), firstTarget) else {
                continue
            }
            
            let secondTarget = nums[nextI] - diff
            
            guard binarySearch(nums, 0, (nextI - 1), secondTarget) != nil else {
                continue
            }
            
            tripletsCount += 1
        }
        
        return tripletsCount
    }
    
    private func binarySearch(_ values: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int? {
        var left = left
        var right = right
        
        var result: Int?
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
                
            if values[mid] <= target {
                left = mid + 1 //move rightwards
                
                if values[mid] == target {
                    result = mid
                }
            } else {
                right = mid - 1 //move leftwards
            }
        }
        
        return result
    }
}
