//
//  PermutationInString.swift
//  LeetCode
//
//  Created by William Boles on 05/05/2023.
//

import Foundation

//https://leetcode.com/problems/permutation-in-string/
//string
struct PermutationInString {
    
    //Time: O(n+m) where n is the number of characters in `s1`, m is the number of characters in `s2`
    //Space: O(1)
    //sliding window
    //two pointers
    //dictionary
    //frequency
    //
    //Solution Description:
    //For `s2` to contain a permutation of `s1` means that a contiguous subarray of `s2` must contain all the characters in `s1`. So
    //first we convery `s1` into a frequency dictionary that tracks how many times a character appears in `s1`. We can then iterate
    //through `s2` and using a sliding window compare the elements in that current window into `s2` against `s1`. We know that the
    //window required to product a permutation will be exactly the size of `s1` so until we hit that window size we only push `p2`
    //rightwards, once that window size has been reached we then need to also push `p1` rightwards. When pushing `p2` rightwards if
    //we find a match in the window, we reduce the count of that character frequency by 1 in `c1Frequency`. If that reduced frequency
    //is equal to or greater than 0 we track it as a match; if the reduced frequency is less than 0 then we too many of that
    //character in the window as even through it matches we don't count it as a match because of that. If we are also moving `p1`
    //rightwards we check if the character dropping out the window has affected the `c1Frequency`. If it has affected `c1Frequency`
    //we increase that characters count by 1 and where that count has now become greater than 0 we also reduce `matches` by 1 (this
    //check ensures that we don't under count a character just because it appear multiple times in that window). If at anypoint
    //`matches` is equal to `windowSize` meaning that all the characters in `s1` are present in that window we return true.
    static func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var c1Frequency = [Character: Int]()
        
        let c1 = Array(s1)
        let c2 = Array(s2)
        
        for c in c1 {
            c1Frequency[c, default: 0] += 1
        }
        
        var p1 = 0
        var p2 = 0
        
        let windowSize = c1.count
        
        var matches = 0
        
        while p2 < c2.count {
            if let count = c1Frequency[c2[p2]] {
                let newCount = count - 1
                c1Frequency[c2[p2]] = newCount
                
                //to handle the scenario where the character `c2[p2]` appears more often in the current window then it does
                //in `c1` so we only count it as a match if same character in `c1` isn't already paired up
                 if newCount >= 0 {
                    matches += 1
                }
            }
            
            guard matches != windowSize else {
                return true
            }
            
            let currentWindowSize = (p2 - p1) + 1
            if currentWindowSize == windowSize {
                
                //as we are about to move p1 we need to "re-add" c2[p1] to our frequency count if we had removed it as it will
                //no longer be part of our window
                if let count = c1Frequency[c2[p1]] {
                    let newCount = count + 1
                    c1Frequency[c2[p1]] = newCount
                    
                    //to handle the scenario where the same character appears more than once in the window, we only reduce
                    //`matches` if removing `c2[p1]` would result in the frequency increasing above zero
                    if newCount > 0 {
                        matches -= 1
                    }
                }
                
                p1 += 1
            }
            
            //always move p2 forward regardless of p1 moving as any movement in p1 would result in a correctly-sized window becoming
            //too small so by always moving p2 rightwards we ensure that once we have a correctly-sized window we always do
            p2 += 1
        }
        
        return false
    }
}
