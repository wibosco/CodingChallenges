// Created 07/03/2024.

import Foundation

//https://leetcode.com/problems/reverse-words-in-a-string-iii/
struct ReverseWordsInAStringIII {
  
    //Time: O(n) where n is the number of elements in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we attempt to find the start (p1) and end (p2) of each word in this `s`. Encountering a space character
    //or the end of `s` is used to determine the end of a word. Once we have found a word with `p1` and `p2` at the start and
    //end of that word we swap over the characters by moving `p1` forward and `p2` backwards until we overlap. We repeat this
    //process for every word in `s`.
    func reverseWords(_ s: String) -> String {
        var characters = Array(s)
        
        var p1 = 0
        var p2 = 0
 
        while p2 <= characters.count {
            // `p2 == characters.count` must come as the first condition otherwise this `OR` will crash
            if p2 == characters.count || characters[p2] == " " {
                reverse(&characters, p1, (p2 - 1))
                
                p1 = p2 + 1
            }
            
            p2 += 1
        }
    
        return String(characters)
    }
    
    private func reverse(_ characters: inout [Character], _ left: Int, _ right: Int) {
        var left = left
        var right = right
        
        while left <  right {
            let temp = characters[right]
            characters[right] = characters[left]
            characters[left] = temp
            
            left += 1
            right -= 1
        }
    }
}
