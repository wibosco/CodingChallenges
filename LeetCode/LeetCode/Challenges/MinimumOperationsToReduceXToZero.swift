//
//  MinimumOperationsToReduceXToZero.swift
//  LeetCode
//
//  Created by William Boles on 05/11/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/
struct MinimumOperationsToReduceXToZero {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sliding window
    //inverted thinking
    //
    //Solution Description:
    //Rather than attempting to find the `x` by removing edge elements from either end of `nums` we instead attempt to find
    //`nums-total - x` as this is the value that will required for the edge elements to equal `x`. This approach allows us to use
    //a sliding window to calculate the inverted-x (`windowTarget`) value and so execute in O(n) time as anything not in the
    //window must at either edge. Ee want to maximise the number of elements in the window to minimise the number of elements left
    //on the edges. First we calculate the sum of all the elements in `nums` and subtract `x` to get our target. Then starting at
    //index 0 we iterate through `nums` rightwards. With each rightward iteration we add the value of the element at index `right`
    //to `windowTotal`, if that value if greater than `windowTarget` we reduce `windowTotal` by moving the `left` index rightwards
    //until `windowTotal` is either equal to or greater than `windowTarget`. Next we check if `windowTotal` is equal to
    //`windowTarget`, if it then we then we take the total size of `nums` and subtract the window size from it to determine how
    //many elements are in our edges, if the number of elements in the edges is smaller than `minimumGap` then we update
    //`minimumGap` to that new value. Once `nums` has been iterated through we check if we found a set of edges equal to `x` by
    //checking if `minimumGap` equals `Int.max` and return either -1 for a failure to find `x` or the gap size.
    static func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var left = 0
        var right = 0
        
        var total = 0
        for num in nums {
            total += num
        }
        
        var minimumGap = Int.max
        
        let size = nums.count
        
        var windowTotal = 0
        let windowTarget = total - x
        
        while right < nums.count {
            windowTotal += nums[right]
            
            while left <= right && 
                    windowTotal > windowTarget {
                windowTotal -= nums[left]
                
                left += 1 //increment left pointer until we have a chance of being equal to target
            }
            
            if windowTotal == windowTarget {
                let gap = size - (right - left + 1)
                minimumGap = min(minimumGap, gap)
            }
            
            right += 1 //always increment the right pointer
        }
        
        return minimumGap == Int.max ? -1 : minimumGap
    }
}
