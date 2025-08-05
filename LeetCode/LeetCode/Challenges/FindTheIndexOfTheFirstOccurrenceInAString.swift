//
//  FindTheIndexOfTheFirstOccurrenceInAString.swift
//  LeetCode
//
//  Created by William Boles on 12/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/

struct FindTheIndexOfTheFirstOccurrenceInAString {
    
    //Time: O(n + m) where n is the number fo elements in `haystack`
    //               where m is the number of elements in `needle`
    //Space: O(n + m)
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
    
    //Time: O(n * m) where n is the number of elements in `haystack`
    //               where m is the number of elements in `needle`
    //Space: O(1)
    //array
    //nested loops
    //two pointers
    //
    //Solution Description:
    //Using nested loop and two pointers (really three pointers but two are the same - `i` and `p2` ) we are able to traverse
    //through `characters` and at each index check (`i`) if it is the start of `target`. When performing the check we use two
    //pointers `p1` and `p2` to access `characters` and `target` at the relevant indexes. If the characters at those indexes
    //match we continue on by incrementing both pointers and repeat the process; If the characters at those indexes don't
    //match we return and the outer loops moves onto the next index of `characters`. If we reach the end of `characters`
    //without finding `target` then we return -1.
    func strStr2(_ haystack: String, _ needle: String) -> Int {
        let characters = Array(haystack)
        let target = Array(needle)
        
        guard characters.count >= target.count else {
            return -1
        }
        
        //no point in comparing if the number of elements left in `characters` is less than in `target`
        let upperBounds = (characters.count - target.count)
        
        for i in 0...upperBounds {
            if same(characters, target, i) {
                return i
            }
        }
        
        return -1
    }
    
    private func same(_ characters: [Character], _ target: [Character], _ start: Int) -> Bool {
        var p1 = 0
        var p2 = start
        
        while p1 < target.count && p2 < characters.count {
            guard characters[p2] == target[p1] else {
                return false
            }
            
            p1 += 1
            p2 += 1
        }
        
        return true
    }
    
    //Time: O(n * m) where n is the number of characters in `haystack`
    //               where m is the number of characters in `needle`
    //Space: O(1)
    //array
    //string
    //two pointers
    //fast forward
    //
    //Solution Description:
    //We iterate throught `haystack` and compare each character encountered to the first character of `needle`. If they match
    //we to loop through both `haystack` and `needle` comparing each character against it's counterpart using two new
    //pointers - `p2` and `p3`. We create new pointers so that if this is a false start we can return to where we where so
    //ensuring that we don't miss any potential other `needle` instances. If the inner loop matches all the way to the end of
    //`needle` we return the outer pointer `p1` (as this is the start of `needle`); if the inner loop doesn't match all the
    //way to the end of `needle` we reset `p2` back to 0 and continue the outer loop. If after iterating through all
    //characters in `haystack` we haven't found `needle`, we return -1.
    func strStr3(_ haystack: String, _ needle: String) -> Int {
        let haystack = Array(haystack)
        let needle = Array(needle)

        var p1 = 0
        var p2 = 0

        while p1 < haystack.count {
            if haystack[p1] == needle[p2] {
                var p3 = p1
                while p3 < haystack.count, p2 < needle.count, haystack[p3] == needle[p2] {
                    p3 += 1
                    p2 += 1
                }

                if p2 == needle.count {
                    return p1
                } else {
                    p2 = 0
                }
            }

            p1 += 1
        }

        return -1
    }
}
