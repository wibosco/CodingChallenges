//
//  ShortestUnsortedContinuousSubarray.swift
//  LeetCode
//
//  Created by William Boles on 07/09/2024.
//

import Foundation

//https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
struct ShortestUnsortedContinuousSubarray {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //min
    //max
    //
    //Solution Description:
    //We can think of `nums` as having 3 intial parts: min-sorted, unsorted, max-sorted - all 3 might not exist as subarrays
    //with values at the same time. It is fairly simple to determine what initial min-sorted and max-sorted subarrays by simply
    //making sure each subarray is in non-descending order but how do we know that there isn't a value(s) in the unsorted 
    //subarray that renders the initial min-sorted and max-sorted subarrays invalid? Well, we do this by capturing the min and
    //max values in the unsorted subarray (note, only the  unsorted elements for min and max) and then comparing the min-sorted
    //and max-sorted subarray values against min and max respectively. This will result in either the initial min-sorted and
    //max-sorted boundaries staying the same or being moved "backwards" (left for min-sorted and right for max-sorted) into the
    //sorted subarrays as the min and max value would be at that index if `nums` was sorted. Note the the boundaries cannot
    //move "fowards" as once we our comparison moves into the unsorted subarray the first element will fail our condition. Once
    //we have adjusted our boundaries we subtract `p1` and `p2` and add 1 to get the count of the unsorted subarray.
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var minUnsortedValue = Int.max
        var maxUnsortedValue = Int.min
        
        var iteratingUnsorted = false
        
        var p1 = 1
        while p1 < nums.count {
            if nums[p1] < nums[(p1 - 1)] {
                iteratingUnsorted = true
            }
            
            if iteratingUnsorted {
                minUnsortedValue = min(minUnsortedValue, nums[p1])
            }
            
            p1 += 1
        }
        
        iteratingUnsorted = false
        
        var p2 = nums.count - 2
        while p2 >= 0 {
            if nums[p2] > nums[(p2 + 1)] {
                iteratingUnsorted = true
            }
            
            if iteratingUnsorted {
                maxUnsortedValue = max(maxUnsortedValue, nums[p2])
            }
            
            p2 -= 1
        }
        
        p1 = 0
        p2 = nums.count - 1
        
        while p1 < nums.count, minUnsortedValue >= nums[p1] {
            //when this fails p1 will be at the right-most element of the min-sorted array
            p1 += 1
        }
        
        while p2 >= p1, maxUnsortedValue <= nums[p2] {
            //when this fails p2 will be at the left-most element of the max-sorted array
            p2 -= 1
        }
 
        return p2 - p1 + 1
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //sorting
    //two pointers
    //
    //Solution Description:
    //By sorting `nums` into non-descending order we have an array to compare `nums` against - `sortedNums`. Using two pointers
    //we first iterate from left-to-right and find the index where `nums[p1] != nums[p2]` as this will be the left boundary of
    //any unsorted subarray. Then we repeat the process but this time going right-to-right to attempt to find the right boundary
    //of any unsorted subarray. Note that in the right-to-left iteration we don't go beyond `p1`, this ensures that we can use
    //the same length calculation for `nums` that is already sorted in non-descending order and a `nums` that needs sorted.
    //Once we have our left and right boundaries we subtract them and add 1 to get the count of the unsorted subarray.
    func findUnsortedSubarraySorted(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        let sortedNums = nums.sorted()
        
        var p1 = 0
        var p2 = nums.count - 1
        
        //left-to-right
        while p1 < nums.count, nums[p1] == sortedNums[p1] {
            p1 += 1
        }
        
        //right-to-left
        while p2 > p1, nums[p2] == sortedNums[p2] { //don't go beyond `p1` to allows return calculate to be simple
            p2 -= 1
        }
        
        return p2 - p1 + 1
    }
}
