// Created 04/09/2024.

import Foundation

//https://leetcode.com/problems/reverse-words-in-a-string-ii/
struct ReverseWordsInAStringII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(1)
    //string
    //array
    //two pointers
    //multi-pass
    //
    //Solution Description:
    //First we need to reverse all the characters in `s` which moves the words into the right position but backwards so then we need 
    //to determine the boundaries of each word and reverse the word itself.
    func reverseWords(_ s: inout [Character]) {
        //reverse all characters
        reverseCharacters(0, (s.count - 1), &s)
            
        //reverse each word
        var p1 = 0
        var p2 = 0
    
        while p2 < s.count {
            if s[p2] == " " { //reached the end of the word
                reverseCharacters(p1, (p2 - 1), &s)
                
                p2 += 1
                p1 = p2
            } else {
                p2 += 1
            }
        }
        
        reverseCharacters(p1, (p2 - 1), &s)
    }
    
    private func reverseCharacters(_ p1: Int, _ p2: Int, _ s: inout [Character]) {
        var p1 = p1
        var p2 = p2
        
        while p1 < p2 {
            let tmp = s[p1]
            s[p1] = s[p2]
            s[p2] = tmp
                
            p1 += 1
            p2 -= 1
        }
    }
}
