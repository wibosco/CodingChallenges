// Created 27/02/2024.

import Foundation

//https://leetcode.com/problems/count-the-number-of-incremovable-subarrays-i/
struct CountTheNumberOfIncremovableSubarraysI {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //There are 3 possible ways to form ascending subarrays when removing one subarray of elements:
    //
    //1. Remove from the beginning
    //2. Remove from the end
    //3. Remove from the middle
    //
    //To remove from the beginning we iterate through `nums`, checking that the element that comes after the current element is
    //greater than it - once that fails to be true or we run out of elements we exit the loop and update result.
    //
    //To remove from the end we iterate through `nums` in reverse, checking that the element that comes before the current
    //element is less than it - once that fails to be true or we run out of elements we exit the loop and update result. As we
    //are working in reverse to determine how many incrementing values we have we take `right` away from the count of `nums`.
    //
    //To remove elements inside we reset `left` to 0 and compare that element against the element at `right`, if `right` is
    //greater then we know that we can remove the subarray between `left` and `right` and form an ascending array - as
    //everything to the right of `right` is also incrementing we can all elements in `right` in that remove subarray array as
    //well. We keep incrementing `left` until we either find a value that is equal to or greater than that at `right` in which
    //case we increment `right` and continue comparing against current `left` (notice we don't reset `left`), or `left` moves
    //to the edge of the original incrementing subarray from 0, at which point we return `result`. If we run out of elements we
    //return `result`.
    func incremovableSubarrayCountSmart(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 1
        }
        
        guard nums.count > 2 else {
            return 3
        }
        
        var result = 1 // removing all nums is valid so we start at 1
        
        // left edge increasing, remove the tail
        var left = 0
        while left < nums.count - 1 && nums[left] < nums[(left + 1)] {
            left += 1
        }
        result += left + 1 //+1 as indexes start from 0
        
        // right edge increasing, remove the head
        var right = nums.count - 1
        while right > 0 && nums[right - 1] < nums[right] {
            right -= 1
        }
        result += nums.count - right
        
        if left >= right { //all nums are in increasing order so return all possible subarrays
            //formula for calculating how many possible subarrays from this length
            return nums.count * (nums.count + 1) / 2
        }
        
        //at this point we know that there is at least one non-incrementing element in `nums`
        
        // subarrays in the middle
        left = 0
        while right < nums.count {
            while nums[left] < nums[right] { //if left catches right then this will be false
                //as everything to the right of `right` is incrementing omitting any elements gives a valid array so count all
                //possible combinations
                result += nums.count - right
                if nums[left] >= nums[(left + 1)] { //can't include `left + 1` in incrementing array as it is not incrementing
                    return result
                }
                left += 1
            }
            right += 1
        }
        
        return result
    }
    
    //Time: O(n^3) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //subarray
    //nested loops
    //
    //Solution Description:
    //We generate all possible subarrays of `nums` and check if that subarray is incrementing.
    func incremovableSubarrayCount(_ nums: [Int]) -> Int {
        var result = 0
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                var newArray = nums
                newArray.removeSubrange(i...j)

                if isIncrementing(newArray) {
                    result += 1
                }
            }
        }
        
        return result
    }
    
    private func isIncrementing(_ values: [Int]) -> Bool {
        guard values.count > 1 else {
            return true
        }
        
        for i in 1..<values.count {
            if values[i] <= values[(i - 1)] {
                return false
            }
        }
        
        return true
    }
}
