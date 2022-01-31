//
//  TwoSumII.swift
//  CodingChallenges
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
struct TwoSumII {
    
    //Time: O(n)
    //two pointers
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum == target {
                return [(left + 1), (right + 1)]
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return []
    }
    
    //Time: O(n log n)
    //binary search
    static func twoSumBinarySearch(_ numbers: [Int], _ target: Int) -> [Int] {
        for (index, number) in numbers.enumerated() {
            let delta = target - number
            //to avoid returning the same index twice we need to exclude it from the search domain
            let indexOffset = index + 1
            let subArray = Array(numbers[indexOffset...]) //will never go out of bounds due to problem always having an answer
            if let sIndex = search(subArray, delta) {
                //indexing from 1
                return [(index + 1), ((sIndex + indexOffset) + 1)].sorted() //sorting only for unit tests
            }
        }
        
        return []
    }
    
    private static func search(_ numbers: [Int], _ target: Int) -> Int? {
        var left = 0
        var right = numbers.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if numbers[mid] == target {
                return mid
            } else if numbers[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return nil
    }

    //Time: O(n)
    //dictionary
    static func twoSumDictionary(_ numbers: [Int], _ target: Int) -> [Int] {
        var visted = [Int: Int]()
        
        for (index, number) in numbers.enumerated() {
            let delta = target - number
            if let partner = visted[delta] {
                return [(partner + 1), (index + 1)]
            }
            visted[number] = index
        }
        
        return []
    }
}
