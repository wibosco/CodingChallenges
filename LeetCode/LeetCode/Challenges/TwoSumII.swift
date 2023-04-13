//
//  TwoSumII.swift
//  LeetCode
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//array
struct TwoSumII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //two pointers
    //sorted
    //
    //Solution Description:
    //As `numbers` is sorted we can use two pointers at either end to iterate through the array to find `target`. If the
    //elements at `left` and `right` sum to `target` then we are done and can return those indexes; if the elements at
    //`left` and `right` sum to greater than `target` then we need to reduce the sum value at `right` by moving inwards by
    //1 (remember `numbers` is sorted so moving the `left` pointer inwards would only increase how over `target` we are so
    //our only option is moving the `right` pointer); if the elements at `left` and `right` sum to less than `target` then
    //we need to increase the sum value which we can do by moving the `left` pointer inwards (remember `numbers` is sorted
    //so moving the `right` pointer inwards would only reduce the sum value (which is already too low) so our only option
    //is moving the `left` pointer)
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
        
        return [Int]()
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //sorted
    //
    //Solution Description:
    //As `numbers` is sorted, we use its sortedness to speed up searching for partner to the present `nums` element by using
    //binary search to half the search space after each mismatch. With each iteration through `nums` we can further reduce
    //the search space as only `nums` elements after the current element could be valid partners so the `left` boundary of
    //our binary search will gradually creep forward.
    static func twoSumBinarySearch(_ numbers: [Int], _ target: Int) -> [Int] {
        for (i, num) in numbers.enumerated() {
            let diff = target - num
            
            //only search indexes in front of i as if a previous index was its partner then we would have found
            //the current `i` during that previous `i`s iteration
            var left = (i + 1)
            var right = numbers.count - 1
            
            while left <= right {
                let mid = left + (right - left) / 2
                
                if numbers[mid] == diff {
                    return [(i + 1), (mid + 1)] //array is 1-indexed
                } else if numbers[mid] > diff {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return [Int]()
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //nested loops
    //sorted
    //
    //Solution Description:
    //Iterate through `nums` and add every other `nums` element after it to check if the sum equals `target`. As `nums` is sorted
    //once we encounter elements that are greater than the difference between `target` - current `nums` element then we can exit
    //that iteration as no further `nums` elements will allow us to reach `target`
    static func twoSumNestedLoops(_ numbers: [Int], _ target: Int) -> [Int] {
        for (i, num) in numbers.enumerated() {
            guard (i + 1) < numbers.count else {
                break
            }
            
            let diff = target - num
            
            for j in (i + 1)..<numbers.count { //using enumerated here means we need to offset j as the index will start at 0
                let other = numbers[j]
                if other == diff {
                    return [(i + 1), (j + 1)] //array is 1-indexed
                } else if other > diff {
                    break
                }
            }
        }
        
        return [Int]()
    }
}
