// Created 02/09/2024.

import Foundation

//https://leetcode.com/problems/reverse-string-ii/
struct ReverseStringII {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Starting at index 0 we iterate through `chars` in `2k` steps. At each step we reverse `k` characters from that index
    //using two pointers in the `chars` array. Particular attention needs to be given to where `k` characters would take us
    //beyond the size of the array - to avoid this we take the minimum of either the final index of `chars` or `k` indexes
    //from `p1` as our reversible string. Once `p1`exceeds the end of the array we return `chars` as a string
    func reverseStr(_ s: String, _ k: Int) -> String {
        var chars = Array(s)
        
        var p1 = 0
        
        while p1 < chars.count {
            let end = min((chars.count - 1), (p1 + (k - 1))) //avoid going beyond the end of `chars`
            reverseStr(&chars, p1, end)
            
            p1 += 2 * k
        }
        
        return String(chars)
    }
    
    private func reverseStr(_ chars: inout [Character], _ start: Int, _ end: Int) {
        var left = start
        var right = end
        
        while left < right {
            let tmp = chars[left]
            chars[left] = chars[right]
            chars[right] = tmp
            
            left += 1
            right -= 1
        }
    }
}
