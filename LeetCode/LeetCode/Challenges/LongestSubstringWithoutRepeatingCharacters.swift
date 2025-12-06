// Created 04/11/2021.

import Foundation

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
struct LongestSubstringWithoutRepeatingCharacters {
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //string
    //sliding window
    //
    //Solution Description:
    //Using a dictionary `map` to store the characters we have already seen, we iterate through `s`. As we iterate through we keep
    //track of the start of our non-repeating subarray - `left`. For each character we encounter we check if we have already seen
    //the current character in the current on-repeating subarray i.e. from `left...right`. If we have seen that character we set
    //the `left` to be the index after that previous version of the the current character (it must the index after so as to exclude
    //the repeat). We then calculate the length of the current non-repeating characters and compare it with our all time longest.
    //If it's longer we replace it. Once all characters have been checked we return `longest`.
    //
    //N.B. There is no need to "cleanup" `map` as we can just exclude those entries in `map` that fall outside of the window.
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var map = [Character: Int]()

        var left = 0
        var right = 0
        var longest = 0

        while right < chars.count {
            let c = chars[right]
            //`left` could have the same value as `index` so needs to be `>=` rather than just `>`
            if let index = map[c], index >= left { //only care about indexes that come after the start of the window
                left = index + 1
            }

            map[c] = right
            longest = max(longest, (right - left + 1))

            right += 1
        }

        return longest
    }
    
    //Time: O(n) where n is the characters in `s`
    //Space: O(n) where n is the characters in `s`
    //string
    //sliding window
    //
    //Solution Description:
    //Using a dictionary `map` to store the characters we have already seen, we iterate through `s`. As we iterate through we keep
    //track of the start of our non-repeating subarray - `left`. For each character we encounter we check if we have already seen
    //the current character in the current on-repeating subarray i.e. from `left...right`. If we have seen that character we set
    //the `left` to be the index after that previous version of the the current character (it must the index after so as to exclude
    //the repeat). We then calculate the length of the current non-repeating characters and compare it with our all time longest.
    //If it's longer we replace it. Once all characters have been checked we return `longest`.
    func lengthOfLongestSubstringAlt(_ s: String) -> Int {
        let chars = Array(s)
        var map = [Character: Int]()

        var left = 0
        var right = 0
        var longest = 0

        while right < chars.count {
            let c = chars[right]
            if let index = map[c] {
                for i in left...index { // cleanup map by removing those indexes that are no longer in the window
                    map[chars[i]] = nil
                }
                left = index + 1
            }

            map[c] = right
            longest = max(longest, (right - left + 1))

            right += 1
        }

        return longest
    }
}
