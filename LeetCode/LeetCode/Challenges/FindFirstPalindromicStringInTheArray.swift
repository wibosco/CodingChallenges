//
//  FindFirstPalindromicStringInTheArray.swift
//  LeetCode
//
//  Created by William Boles on 06/03/2024.
//

import Foundation

//https://leetcode.com/problems/find-first-palindromic-string-in-the-array/
struct FindFirstPalindromicStringInTheArray {
    
    //Time: O(n * m) where n is the number of elements in `words`
    //               where m is the largest element in `words`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //Taking each element in `words`, we use two pointers starting at either end of `word`. We compare the element at each pointer,
    //if they match we increment and decrement to move onto the next elements and repeat the process; if they don't matchwe know 
    //that this `word` is not a palindrome and can stop comparing elements. We reapt this process with each `word` until we find a
    //palindrome, which we immediately return. If after iterating through all elements in `words` we don't find a palindrome we
    //return an empty string.
    func firstPalindrome(_ words: [String]) -> String {
        for word in words {
            let characters = Array(word)
            
            var left = 0
            var right = characters.count - 1
            
            var isPalindrome = true
            
            while left < right {
                if characters[left] != characters[right] {
                    isPalindrome = false
                    break
                }
                
                left += 1
                right -= 1
            }
            
            if isPalindrome {
                return word
            }
        }
        
        return ""
    }
}
