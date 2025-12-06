// Created 20/07/2023.

import Foundation

//https://leetcode.com/problems/frequency-of-the-most-frequent-element/
struct FrequencyOfTheMostFrequentElement {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //sorting
    //sliding window
    //array
    //greedy
    //
    //Solution Description:
    //As we can only increment up to `k` times, we know that any given `number` can only be replicated by numbers that are
    //already equal to `number` or less than `number`. So by sorting `nums`, all possible candidates for incrementing will be to
    //the left of `number`. Using a sliding window we can determine how many (if any) of those "lesser" numbers can be
    //incremented to match `number`. Rather than trying to actually increment `k` times and checking, we can instead get the sum
    //of the window's current values and add `k` to that to calculate the possible maximum sum and take the length of window
    //and multiple it by `number` to determine if all numbers could be incremented to match. If it is possible then we compare
    //the current window size against the maximum seen so far and expand the window size by moving right; if it isn't possible
    //we shrink the window by moving left and reduce the window sum by subtracting that removed value. It's important to note
    //that we don't hold `right` in position for a failed comparison, instead `right` always moves forward because a window size
    //is only that size because of a previous valid "+ k" operation so shrinking the window would achieve at best the same window
    //size as a previous successful match. We repeat this process until all elements in `nums` have been tested.
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        
        var maxFrequencyCount = 0
        var windowSum = 0
        
        var left = 0
        var right = 0
        
        while right < nums.count {
            let windowLength = (right - left) + 1
            
            windowSum += nums[right]
            
            //maximum total of window if all of `k` is "spent"
            let maxPossibleSum = windowSum + k
            //total sum required for `right` to be matched by all elements in window
            let sumNeededToMatchRight = nums[right] * windowLength
            
            if maxPossibleSum >= sumNeededToMatchRight {
                maxFrequencyCount = max(maxFrequencyCount, windowLength)
            } else {
                windowSum -= nums[left]
                left += 1
            }
            
            right += 1
        }
        
        return maxFrequencyCount
    }
}
