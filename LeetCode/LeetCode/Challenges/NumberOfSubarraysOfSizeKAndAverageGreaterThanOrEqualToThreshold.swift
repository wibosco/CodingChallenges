//
//  NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThreshold.swift
//  LeetCode
//
//  Created by William Boles on 19/07/2023.
//

import Foundation

//https://leetcode.com/problems/number-of-sub-arrays-of-size-k-and-average-greater-than-or-equal-to-threshold/
//array
struct NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThreshold {
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //sliding window
    //
    //Solution Description:
    //Using a sliding window of length `k` we move through `arr` calculating the average of the elements inside the
    //window. Special has to be given to ensure our window is of length `k`, before calculating the average. Once
    //the window is of the required length we compare the average of it's elements against `threshold` and increment
    //`subarrayCount` if needed. To improve performance we don't recalculate the window's sum by iterating through
    //its elements instead we keep an on-going sum - `WindowSum`, which we add or subtract values from as the
    //window moves. Once all subarrays of length `k` have been checked we return `subarrayCount`.
    //
    //N.B. A subarray is contiguous slice of elements from a larger array.
    static func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        var windowSum = 0
        var subarrayCount = 0
        
        var left = 0
        var right = 0
        
        while right < arr.count {
            windowSum += arr[right]
            
            if right >= (k - 1) {
                let average = windowSum / k
        
                if average >= threshold {
                    subarrayCount += 1
                }
                
                windowSum -= arr[left]
                    
                left += 1
            }
            
            right += 1
        }
        
        return subarrayCount
    }
}
