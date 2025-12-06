// Created 12/07/2023.

import Foundation

//https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
struct FindTheIndexOfTheFirstOccurrenceInAString {
    
    //Time: O(n + m) where n is the number of elements in `haystack`
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
    //Using KMP we traverse through `haystack` once to find `needle`, avoiding the `O(n * m)` cost of nested loops. We do this by
    //building an LPS (Longest Proper Prefix which is also Suffix) table which tells us how far to backtrack in `needle` when a
    //mismatch occurs, allowing us to skip redundant character comparisons.
    //
    //The LPS table captures the pattern's internal structure:
    //
    //Example:
    //
    //  needle = "abcdabcd"
    //  LPS table: [0, 0, 0, 0, 1, 2, 3, 4]
    //
    //  lps[7] = 4 means: the last 4 chars "abcd" match the first 4 chars "abcd"
    //
    //When searching, if we have a partial match then hit a mismatch:
    //
    //  haystack: "abcdabceabcdabcd"
    //             ^^^^^^^✗
    //  needle:   "abcdabcd"
    //
    // We matched 7 chars "abcdabc" then hit 'e' vs 'd' (mismatch at needle[7])
    //
    // Instead of restarting from haystack index 1 (to ensure we fully search `haystack`):
    //    - Use lps[6] = 3 to jump needle back to index 3
    //
    //This works because the last 3 matched chars "abc" also match needle's first 3. We don't re-check those characters in
    //haystack. If that still mismatches, continue backtracking via LPS until we find a match or reach needle[0]. Then
    //continue searching from where we left off in haystack. If we reach the end of `needle` we can return the start index.
    //If we reach the end of `haystack` without finding `needle` then we know that `needle` is not present and can return -1.
    //
    //See: https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm
    //See: https://www.youtube.com/watch?v=V5-7GzOfADQ
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
        var slow = 0  //length of current matching prefix
        var fast = 1  //current position we're computing LPS for
        
        while fast < needle.count {
            if needle[fast] == needle[slow] {
                //characters match - extend the matching prefix
                slow += 1
                lps[fast] = slow
                
                fast += 1
            } else {
                if slow != 0 {
                    //mismatch - backtrack to try a shorter prefix
                    //this is the key step that makes LPS construction O(n)
                    slow = lps[(slow - 1)]
                    //don't increment fast - retry this position with shorter prefix
                } else {
                    //Mismatch and no matching prefix at all
                    lps[fast] = 0
                
                    fast += 1
                }
            }
        }
        
        //Search
        
        // Search for needle in haystack using LPS table
        var i = 0  //index in haystack
        var j = 0  //index in needle
        
        while i < haystack.count {
            if haystack[i] == needle[j] {
                //characters match - advance both pointers
                i += 1
                j += 1
                
                if j == needle.count {
                    //found complete match
                    return i - j
                }
            } else {
                if j != 0 {
                    //mismatch - use LPS to backtrack in needle
                    // dn't move i - we don't need to re-check this character
                    j = lps[j - 1]
                } else {
                    //mismatch at start of needle - move to next haystack character
                    i += 1
                }
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
