// Created 07/07/2023.

import Foundation

//https://leetcode.com/problems/is-subsequence/
struct IsSubsequence {
    
    //Time: O(n) where n is the larger of `s` or `t`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `s` and `t` comparing the element at `sP` against the that at `tP`. If they match
    //then we advance/increment the `sP` to search for the next character in the sequence. Regardless of matching or not we
    //always advance/increment the `tP`. By iterating linearly through `t` we ensure that `s` is matched in the correct
    //order. At the end we know if all of `s` was found in `t`, if `sP` has went beyond the elements of `s`.
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard t.count >= s.count else {
            return false
        }
        
        var sP = 0
        var tP = 0
        
        let sCharacters = Array(s)
        let tCharacters = Array(t)
        
        while sP < sCharacters.count && tP < tCharacters.count {
            if sCharacters[sP] == tCharacters[tP] {
                sP += 1
            }
            
            tP += 1
        }
        
        return sP == sCharacters.count
    }
}
