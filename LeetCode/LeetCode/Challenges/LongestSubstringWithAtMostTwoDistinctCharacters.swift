// Created 01/06/2025.

import Foundation

//https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/
struct LongestSubstringWithAtMostTwoDistinctCharacters {
    
    //Time: O(
    //Space: O(
    //sliding window
    //two pointers
    //array
    //string
    //dictionary
    //
    //Solution Description:
    //Using a sliding window where we have at most two different characters in that window we iterate through `s`. To know
    //which characters are in the window we store them in `charsInWindow` alongside their rightmost index, this allows us
    //to know if we encounter a third character. If we do encounter a third character then we determine which of the
    //current two known characters has to be replaced by comparing their rightmost indexes - the character with the smaller
    //(leftmost) index is replaced with the new character and the `left` pointer of the sliding window moved to that
    //replaced character index + 1. At the end of each iteration we calculate the current window size and if that size if
    //larger than `longest` we replace it. Once all characters in `s` have been processed we return `longest`.
    //
    //Similar to: https://leetcode.com/problems/fruit-into-baskets/
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var left = 0
        var right = 0
        
        var charsInWindow = [Character: Int]()
        
        var longest = -1
        let chars = Array(s)
        
        while right < chars.count {
            let char = chars[right]
            charsInWindow[char] = right
            
            if charsInWindow.count > 2 {
                let indexToBeDeleted = charsInWindow.values.min()!
                left = indexToBeDeleted + 1
                
                charsInWindow[chars[indexToBeDeleted]] = nil
            }
            
            longest = max(longest, ((right - left) + 1))

            right += 1
        }
        
        return longest
    }
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //sliding window
    //two pointers
    //array
    //string
    //
    //Solution Description:
    //Using a sliding window where we have at most two different characters in that window we iterate through `s`. To know
    //which characters are in the window we use `firstChar` and `secondChar` alongside their rightmost indexes
    //`firstLastSeenIndex` and `secondLastSeenIndex`. This allows us to know if we encounter a third character. If we do
    //encounter a third character then we determine which of the current two known characters has to be replaced by
    //comparing their rightmost indexes - the character with the smaller (leftmost) index is replaced with the new
    //character and the `left` pointer of the sliding window moved to that replaced character index + 1. At the end of
    //each iteration we calculate the current window size and if that size if larger than `longest` we replace it. Once
    //all characters in `s` have been processed we return `longest`.
    //
    //Similar to: https://leetcode.com/problems/fruit-into-baskets/
    func lengthOfLongestSubstringTwoDistinct2(_ s: String) -> Int {
        var left = 0
        var right = 0

        var firstChar: Character = " "
        var secondChar: Character = " "

        var firstLastSeenIndex = -1
        var secondLastSeenIndex = -1

        var longest = -1

        let chars = Array(s)

        while right < chars.count {
            let char = chars[right]

            if firstChar == char {
                firstChar = char
                firstLastSeenIndex = right
            } else if secondChar == char {
                secondChar = char
                secondLastSeenIndex = right
            } else {
                //new character
                if firstLastSeenIndex > secondLastSeenIndex {
                    left = secondLastSeenIndex + 1

                    secondChar = char
                    secondLastSeenIndex = right
                } else {
                    left = firstLastSeenIndex + 1

                    firstChar = char
                    firstLastSeenIndex = right
                }
            }

            longest = max(longest, ((right - left) + 1))

            right += 1
        }

        return longest
    }
}
