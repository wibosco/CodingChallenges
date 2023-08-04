//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/longest-common-prefix/
struct LongestCommonPrefix {
    
    //Time: O(n^2) where n is the number of characters in `strs`
    //Space: O(c) where `c` is the number of characters in the smallest element in `strs`
    //string
    //array
    //vertical scanning
    //
    //Solution Description:
    //First we convert our strings to character arrays to allow for easier index accessing. Next we take the first element
    //and iterate through its characters. At each iteration we compare the `c` against the character at the same index in
    //each of the other `chrs`. If that index doesn't exist or the character doesn't match `c` we return the prefix that we
    //have built up so far. If we iterate through all characters in `chrs[0]` and only find matches then we can return `prefix`
    //
    //NB: if we get to the final return it means not only that the whole of `chrs[0]` is the prefix but also that `chrs[0]`
    //must the smallest (or joint smallest) element in `strs`
    static func longestCommonPrefix(_ strs: [String]) -> String {
        let chrs = strs.map { Array($0) } //to optimise access
        
        var prefix = [Character]()
        for (i, c) in chrs[0].enumerated() {
            for chr in chrs[1...] {
                if i >= chr.count {
                    return String(prefix)
                }
                
                if chr[i] != c {
                    return String(prefix)
                }
            }
            
            prefix.append(c) //`c` is found in all `chrs` elements
        }
        
        return String(prefix)
    }
}
