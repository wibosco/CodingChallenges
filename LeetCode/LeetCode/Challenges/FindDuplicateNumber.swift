//
//  FindDuplicateNumber.swift
//  LeetCode
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-the-duplicate-number/
//array
struct FindDuplicateNumber {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //linked list
    //circular dependency
    //two pointers
    //slow and fast pointers
    //
    //Solution Description:
    //Knowing that `nums` contains values that are less than its count (i.e. [1, n]) we can use those values as indexes. So by
    //treating `nums` as a linked list where the value of the current element is the `next` property, we can use fast and slow
    //pointers to detect a cycle with that linked list and from there determine which element is the duplicate by iterating
    //that cycle until they collide.
    //
    //See: https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
    //c
    //Similar to: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/
    static func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow] //use the value within the array to set the next indexpath
            fast = nums[nums[fast]]//make two "jumps"
        } while slow != fast
        
        slow = nums[0] //leave fast in the loop and reset slow back to the start
        
        while slow != fast { //now when they meet again it will be on the duplicate
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(1)
    //binary search
    //divide and conquer
    //nested loops
    //
    //Solution Description:
    //As we know that `nums` goes from `[1, n]` without gaps we know that if we have [1, 2, 3, 4, 5, 6] then 3 will have 2
    //elements that are less than it so if our array has duplicates then [1, 2, 2, 3, 4, 5, 6] then here 3 has 3 element
    //less than it so the duplicate must be less than 3. We can use this property and a twist on binary search to narrow
    //down our search space. Using binary search we select the mid element in our search space we then check how many
    //elements in `nums` is less than or equal to (in case we have selected the duplicate) `mid` (remember the range is
    //always [1, n]). If that count is greater than expected then we know that potentially we have duplicate and that further
    //searching only needs to happen to the left of `mid` and we move the right boundary left; if count is as expected less
    //than or equal to mid then we know that the duplicate must be to the right of mid and we move the left boundary right.
    static func findDuplicateBinarySearch(_ nums: [Int]) -> Int {
        var left = 1
        var right = nums.count - 1
        
        var dup = -1
        while left <= right {
            let mid = left + (right - left) / 2
            
            var count = 0
            for n in nums where n <= mid { //Time: O(n)
                count += 1
            }
            
            if count > mid {//Note comparison happening against index here
                dup = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return dup
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n) making a copy of `nums`
    //negative marking
    //
    //Solution Description:
    //Knowing that `nums` contains values that are less than its count, we can use those values as indexes. So iterating
    //through `nums` we treat the value of each element as an index and then set that indexes value to be negative. If
    //that second elements value is already negative then we know that we have already been here and the original index
    //(i) is a duplicate
    static func findDuplicateNegativeMarking(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        
        while i < nums.count {
            let num = abs(nums[i])
            //use the value of nums[i] to update the nums array if the value of nums[num] is already a negative
            //then we have already visited it and we have our duplicate
            if nums[num] < 0 {
                return num
            }
            
            nums[num] *= -1
            i += 1
        }
        
        return -1
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //set
    //
    //Solution Description:
    //Using a set (for O(1) search time) to store `nums` elements that we have already seen, we loop through `nums` and check
    //if that element is already in `count`. If it is we have found our duplicate; if it is not then we add it to `count` and
    //continue looping
    static func findDuplicateDictionary(_ nums: [Int]) -> Int {
        var count = Set<Int>()
        for num in nums {
            guard !count.contains(num) else {
                return num
            }
            
            count.insert(num)
        }
        
        return -1
    }
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //sorting
    //
    //Solution Description:
    //First we sort `nums` so that the duplicates is now beside each other. Then we iterate through the sorted array comparing
    //each element with it immediate neighbor. If they match we have found our duplicate; if they don't match we move onto the
    //next element
    static func findDuplicateSorting(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted() //Time: O(n log n)
        for i in 0..<(sortedNums.count - 1) {
            if sortedNums[i] == sortedNums[(i + 1)] { //Time: O(n)
                return sortedNums[i]
            }
        }
        
        return -1
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //nested loops
    //
    //Solution Description:
    //Using two loops we compare each element of `nums` against all other elements until we find the duplicate
    static func findDuplicateLooping(_ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                if nums[i] == nums[j] {
                    return nums[i]
                }
            }
        }
        
        return -1
    }
}
