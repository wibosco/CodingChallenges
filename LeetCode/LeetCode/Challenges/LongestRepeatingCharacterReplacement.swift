//
//  LongestRepeatingCharacterReplacement.swift
//  LeetCode
//
//  Created by William Boles on 11/04/2023.
//

import Foundation

//https://leetcode.com/problems/longest-repeating-character-replacement/
//string
struct LongestRepeatingCharacterReplacement {
    
    //Time: O(n*m) where n is the number of elements in `s`, m is the maximum window size
    //Space: O(n)
    //sliding window
    //dictionary
    //
    //Solution Description:
    //Using a sliding window we are able to iterate through all the elements in `s` and determine the longest repeating character
    //length. We do this by first determining the most frequent character in our current window and seeing if the window size
    //minus that most frequent character count is less than or equal to `k`. If it is less than or equal to `k` then we know that
    //this window can be made up of repeating characters and we compare it to the largest window size we have found so far,
    //replacing it if need be; if it is greater than `k` then we know that expanding the window further will only result a "more
    //wrong" window, so instead we shrink the window by moving `left` to the right and reduce the frequency of the character at
    //that location. To avoid double counting `right` is always incremented.
    //
    //N.B. We never actually create the replacing string as we are only interested in the count so there is no need to know
    //exactly which characters will be replace,
    static func characterReplacement(_ s: String, _ k: Int) -> Int {
        guard k < s.count else {
            return s.count
        }
        
        let chars = Array(s)
        
        var windowFrequency = [Character: Int]()
        var maxWindowSize = 0
        
        var left = 0
        var right = 0

        while right < chars.count {
            windowFrequency[chars[right], default: 0] += 1
            let windowMaxFrequencyCount = windowFrequency.max { a, b in a.value < b.value }?.value ?? 1
            
            let windowSize = (right - left) + 1
            if (windowSize - windowMaxFrequencyCount) <= k { //can we replace enough elements to make them all match
                maxWindowSize = max(maxWindowSize, windowSize)
            } else {
                //current window has too many elements to be replaced so shrink it down
                windowFrequency[chars[left], default: 0] -= 1
                left += 1
            }
            
            right += 1
        }
        
        return maxWindowSize
    }
}
