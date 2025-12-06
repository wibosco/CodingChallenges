// Created 06/12/2025.

import Foundation

//https://leetcode.com/problems/repeated-substring-pattern/
struct RepeatedSubstringPattern {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //KMP
    //Knuth–Morris–Pratt algorithm
    //failure table
    //pi table
    //lps table
    //two pointers
    //substring
    //string
    //backtracking
    //
    //Solution Description:
    //Using the LPS (Longest Proper Prefix which is also Suffix) table construction from KMP we can detect repeating patterns -
    //if a string has a repeating pattern, the LPS table reveals how much the string "overlaps with itself".
    //
    //How it works:
    //1. Build the LPS table for the entire string
    //2. The value of the final element in the LPS table tells us how many characters at the END match the START i.e. if
    //   there is a pattern
    //3. Check if this pattern divides evenly into the string
    //
    //Example:
    //
    //  s = "abcabc"
    //
    //  LPS table: [0, 0, 0, 1, 2, 3]
    //
    //  lps[5] = 3 means: the last 3 chars "abc" match the first 3 chars "abc"
    //
    //  Visual:
    //    a b c | a b c
    //    <-3->   <-3->
    //    prefix  suffix (they match!)
    //
    //  Pattern length = 6 - 3 = 3 → pattern is "abc"
    //  Check: 6 % 3 == 0 → "abc" repeats exactly 2 times
    //
    //The LPS table construction uses backtracking:
    //  - When characters match: extend the matching prefix (slow++, record it)
    //  - When they don't match: backtrack using lps[slow-1] to try a shorter prefix
    //  - This backtracking is what makes the LPS table correct and enables O(n) construction
    //
    //Two conditions must be met:
    //  1. Overlap between prefix and suffix (potential pattern exists)
    //  2. The pattern divides evenly (no partial repetitions)
    //
    //See: https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm
    //See: https://www.youtube.com/watch?v=V5-7GzOfADQ
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let chars = Array(s)
        
        guard chars.count > 1 else {
            return false
        }
        
        //build lps/pi/failure table
        var lps = Array(repeating: 0, count: chars.count)
        var slow = 0  //length of current matching prefix
        var fast = 1  //current position we're computing LPS for
        
        while fast < chars.count {
            if chars[fast] == chars[slow] {
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
        
        //check if the suffix of `s` matches the prefix pattern
        let hasPrefixSuffixOverlap = lps[(chars.count - 1)] > 0
        
        //check if the identified pattern can be repeated fully within `s`
        let patternLength = chars.count - lps[(chars.count - 1)]
        let dividesEvenly = chars.count % patternLength == 0
        
        return hasPrefixSuffixOverlap && dividesEvenly
                 
    }
    
    //Time: O(n * m) where n is the number of characters in `s`
    //               where m is the number of characters in `pattern`
    //Space: O(n + m)
    //array
    //string
    //substring
    //nested loops
    //two pointers
    //
    //Solution Description:
    //We generated every possible repeatable pattern from the prefix of `s` and check if that pattern exists immediately after the
    //end of the pattern prefix. As the pattern can exist multiple times in `s`, if we get to the end of the `pattern` we reset
    //`p1` and start checking the pattern again.
    func repeatedSubstringPattern2(_ s: String) -> Bool {
        let chars = Array(s)
        var pattern = [Character]()

        var p1 = 0

        while p1 < chars.count / 2 {
            let c = chars[p1]
            pattern.append(c)

            if isRepeated(chars, pattern) {
                return true
            }

            p1 += 1
        }

        return false
    }

    private func isRepeated(_ chars: [Character], _ pattern: [Character]) -> Bool {
        var p1 = 0
        var p2 = pattern.count

        while p2 < chars.count {
            guard pattern[p1] == chars[p2] else {
                return false
            }

            p1 = p1 == (pattern.count - 1) ? 0 : (p1 + 1) //reach end of pattern so reset it
            p2 += 1
        }

        return p1 == 0
    }
}
