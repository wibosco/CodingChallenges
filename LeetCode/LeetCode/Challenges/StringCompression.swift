//
//  StringCompression.swift
//  LeetCode
//
//  Created by William Boles on 04/09/2024.
//

import Foundation

//https://leetcode.com/problems/string-compression/
struct StringCompression {
    
    //Time: O(n) where n is the number of characters in `chars`
    //Space: O(1)
    //array
    //string
    //two pointers
    //three pointers
    //fast forward
    //
    //Solution Description:
    //Using three pointers we iterate through chars - `left` is start of the character sequence, `right` is the end of the 
    //character sequence and `compressedEnd` is the end of the section of `arr` that has had the characters already compressed.
    //As we iterate through `chars` we determine how big the current character sequence is by fast-forwarding to the end of
    //that sequence and tracking the number of characters in `repeatingCount`. We then add the character to the compressed
    //section of `chars` and if the sequence was greater than one we also add the number as well. We then set `left` to
    //equal `right` and repeat the process for a new character sequence. Once all characters have been compressed we return
    //`compressedEnd` as the size of the new compressed array.
    func compress(_ chars: inout [Character]) -> Int {
        var compressedEnd = 0 //end of compressed section
        var left = 0
        var right = 0
        
        while right < chars.count {
            var repeatingCount = 0
            
            while right < chars.count && chars[left] == chars[right] {
                repeatingCount += 1
                right += 1
            }
            
            chars[compressedEnd] = chars[left]
            compressedEnd += 1
            
            if repeatingCount > 1 {
                let digits = String(repeatingCount)
                
                for digit in digits {
                    chars[compressedEnd] = digit
                    compressedEnd += 1
                }
            }
            
            left = right //move left onto new character pattern
        }
        
        return compressedEnd
    }
}
