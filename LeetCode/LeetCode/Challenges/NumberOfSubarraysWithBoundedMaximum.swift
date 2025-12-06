// Created 12/09/2024.

import Foundation

//https://leetcode.com/problems/number-of-subarrays-with-bounded-maximum/
struct NumberOfSubarraysWithBoundedMaximum {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //two pointers
    //sliding window
    //counting
    //fast forward
    //
    //Solution Description:
    //Let's see a simplifed example that remove `left` and `right`:
    //
    //[3,2,1]
    //
    //If we work from left to right (ignore the general subarray counting forumla) we would end up with a pattern like this:
    //
    //[3], [3,2], [2], [3,2,1], [2,1], [1]
    //
    //For a total of 6 subarrays. Notice that each time we add an element, we produce the same number of new subarrays pluse 1 more
    //than the previous iteration i.e. `1->2->3` - this is a pattern that continues the more elements we add.
    //
    //Now lets add back in our constraints:
    //
    //[3,2,1], left = 3, right = 5
    //
    //So in order a subarray to be valid, at least one element must be above `left` and all elements must be below `right` so the
    //valid subarrays are:
    //
    //[3], [3,2], [3,2,1]
    //
    //The pattern this time has changed, it is now `1->1->1`. Notice that when a value is added that is below `left` we add the same
    //number of new subarrays that we added previous. Take this bigger example:
    //
    //[3,4,2,1]
    //
    //[3], [3,4], [4], [3,4,2], [4,2], [3,4,2,1], [4,2,1]
    //
    //The pattern above is `1->2->2->2`.
    //
    //Final example, lets add another value on that is greater than or equal to `left`
    //
    //[3,4,2,1,3]
    //
    //[3], [3,4], [4], [3,4,2], [4,2], [3,4,2,1], [4,2,1], [3,4,2,1,3], [4,2,1,3], [2,1,3], [1,3], [3]
    //
    //The pattern above is `1->2->2->2->5`.
    //
    //So from these patterns we can see:
    //
    //1. If the current value is within range then take the count of the elements in that subarray and add to our total.
    //2. If the current value is lower than our range we take the previous count and add it our total.
    //
    //(If the current value is greater than our range we reset count).
    //
    //Using a sliding window we can iterate through `nums` and calculate the number for valid subarrays in that window by using the
    //formula given above. We keep two counts - `totalValidSubArraysCount` for overall count and `currentSubArraysCount` for that
    //current windows count. Where we encounter a `nums` element that is within range we work out how many possible subarrays could
    //be made including that `nums` element and add it to `totalValidSubArraysCount`; where we encounter `nums` element below our
    //range we add the `currentSubArraysCount` to `totalValidSubArraysCount` as while new subarrays can be created `nums` element
    //can not form a subarray on it's own; where we encounter a `nums` element greater than our range we reset
    //`currentSubArraysCount` as this element is a break in subarrays. Finally when we run out of elements we return the total count.
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var p1 = 0
        
        var totalValidSubArraysCount = 0
        
        while p1 < nums.count {
            var p2 = p1
            var currentSubArraysCount = 0
            
            while p2 < nums.count, nums[p2] <= right { //fast-forward
                if nums[p2] >= left {
                    let count = (p2 - p1) + 1 //+1 to get the count
                    totalValidSubArraysCount += count
                    currentSubArraysCount = count //to be used incase `nums[p2]` is below `left`
                } else {
                    //`nums[p2]` is below `left` so can't make a new valid subarray on it's own but can be added to
                    //the exsiting valid subarray count to extend those subarrays
                    totalValidSubArraysCount += currentSubArraysCount
                }
                
                p2 += 1
            }
            
            p1 = p2 + 1 //`p2` is at a value outside the range so jump to the next index
        }
        
        return totalValidSubArraysCount
    }
}
