//
//  MaximumNumberOfVowelsInASubstringOfGivenLength.swift
//  LeetCode
//
//  Created by William Boles on 26/07/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
struct MaximumNumberOfVowelsInASubstringOfGivenLength {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //array
    //string
    //sliding window
    //set
    //
    //Solution Description:
    //Using a sliding window we iterate through `s` keeping track of the count of vowels within a `k` window. As the window moves
    //rightwards we check if the right-most element is a vowel and increment `currentVowelCount` if it is. We then check if that
    //vowel count is the largest we've seen yet. Afterwards we reduce the elements in the window by 1 to prepare for the next
    //iteration by popping the left-most element - if that left-most element was a vowel we decrement `currentVowelCount`.
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let characters = Array(s)
        let vowels = Set<Character>(["a", "e", "i", "o", "u"])
        
        var left = 0
        var right = 0
        
        var currentVowelCount = 0
        var maximumVowelCount = 0
        
        while right < characters.count {
            if vowels.contains(characters[right]) {
                currentVowelCount += 1
            }
            
            maximumVowelCount = max(maximumVowelCount, currentVowelCount)
        
            if ((right - left) + 1) == k {
                if vowels.contains(characters[left]) {
                    currentVowelCount -= 1
                }
                
                left += 1
            }
        
            right += 1
        }
        
        return maximumVowelCount
    }
}
