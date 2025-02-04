//
//  ImplementStrStr.swift
//  LeetCode
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/implement-strstr/
//URL has been changed to https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
struct ImplementStrStr {
    
    //Time: O(n + m) where n is the number fo elements in `haystack`
    //               where m is the number of elements in `needle`
    //Space: O(n + m)
    //string
    //array
    //KMP
    //Knuth–Morris–Pratt algorithm
    //failure table
    //pi table
    //lps table
    //two pointers
    //
    //Solution Description:
    //Using KMP we are to traverse through `haystack` and determine if `needle` is present in a more efficient way when compared
    //to nested loops. We do this by examining `needle` and determining, if any prefixes in `needle` are repeated later on in
    //`needle` which can be used to avoid having to go back to the start of `needle` when comparing against `haystack` instead
    //we can go back to the end of the start of that matching prefix. This prefix knowledge is stored in an `lps-table`
    //(sometimes known as a `failure-table` or `pi-table`) e.g.
    //
    //needle = "ABABD"
    //
    //So here we have a `lps-table` of:
    //
    //ABABD
    //00120
    //
    //So here if we encountered a haystack of `ABABABD` when we hit that third `A` rather than going back to the start of `needle`,
    //the `lps-table` would instead instruct as to go back to needle index `2` and see if that matched - which in this case does
    //match so we continue on and eventually find the whole `needle` string. If it didn't match we would have eventually followed
    //the `lps-table` back to the start of `needle`.
    //
    //As you can see, using an `lps` table can save us a lot of effort by avoiding duplicate work.
    //
    //
    //See: https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm
    //See: https://www.youtube.com/watch?v=V5-7GzOfADQ
    //lps - longest prefix substring
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        guard haystack.count >= needle.count else {
            return -1
        }
        
        let haystack = Array(haystack)
        let needle = Array(needle)
        
        //Generate lps/pi/failure table
        var lps = Array(repeating: 0, count: needle.count)
        var slow = 0

        //The `fast` pointer will linearly move through `needle`, the `slow` pointer will increment and reset back to zero as
        //matching character substrings that match the prefix of `needle` are found later on in `needle`
        for fast in 1..<needle.count {
            //if we have found the same characters as the prefix (the prefix being [0...slow]) later on then increment prefix
            //pointer (`slow`) else reset our prefix pointer (`slow`) back to the start of `needle`. It's important to note here
            //that we are only checking that the current character of `slow` against `fast` rather than `0...slow` because in
            //order for `slow` to be non-zero it's predecessors will have needed to have been matched so building the `lps-table`
            //is an linear operation.
            if needle[fast] == needle[slow] {
                slow += 1
            } else {
                slow = 0
            }
            
            //store that matching prefix end index (`slow`) for the `fast` index
            lps[fast] = slow
        }
        
        //Search
        
        var h = 0
        var n = 0
        
        while h + n < haystack.count {
            if haystack[(h + n)] == needle[n] {
                n += 1
                if n == needle.count {
                    return h
                }
            } else {
                //move n back to a position where the comparison between `haystack` and `needle` matched - this might have not been
                //the case so n is set to 0
                let lastMatchingIndex = max(0, (n - 1))
                let resetIndex = lps[lastMatchingIndex]
                n = resetIndex
                h += 1
            }
        }
        
        return -1
    }
    
    //Time: O(n * m) where n is the number fo elements in `haystack`,
    //               where m is the number of elements in `needle`
    //Space: O(1)
    //string
    //two pointers
    //array
    //
    //Solution Description:
    //Using two pointers we traverse through both `haystack` and `needle` and compare the characters of `haystack` against the relevant
    //character of `needle` i.e. if we have previously matched the first character of `needle` we compare the next character of `haystack`
    //against the second character of `needle`. If at any time we get a mismatch we reset `n` to 0.
    func strStrNestedLoops(_ haystack: String, _ needle: String) -> Int {
        let haystack = Array(haystack)
        let needle = Array(needle)
            
        var h = 0
        var n = 0
        
        while h < haystack.count && n < needle.count {
            if haystack[h] == needle[n] {
                n += 1
            } else {
                h -= n //reset h to before we had any matches with n
                n = 0
            }
            
            h += 1
        }
        
        return (n == needle.count) ? (h - n) : -1
    }
}
