//
//  LongestUncommonSubsequenceII.swift
//  LeetCode
//
//  Created by William Boles on 05/09/2024.
//

import Foundation

//https://leetcode.com/problems/longest-uncommon-subsequence-ii/
struct LongestUncommonSubsequenceII {
    
    //Time: O(n log n + n ^ 2 * m) where n is the number of elements in `strs`
    //                             where m is the number of characters in a `strs` element
    //Space: O(n)
    //string
    //array
    //sorting
    //two pointers
    //subsequence
    //fast forward
    //
    //Solution Description:
    //String "A" can only be a subsequence of string "B" if string "B" is the same size or greater than string "A". So by 
    //sorting `strs` in descending order based on string length we ensure that the first element we find that isn't a
    //subsequence of any other is the longest uncommon subsequence. Starting with the longest elements we loop through all
    //other elements and check is the outer loop element is a subsequence of the inner loop element - if the outer loop
    //element is a subsequence we exit that loop and move onto the next outer loop element; if the outer loop element is not
    //a subsequence we test the next valid inner loop element. If having tested all inner elements, the outer loop elemennt
    //is not a subsequence we return it's count. Note that we can't shorten the inner loop by starting from after the outer
    //loop element's index because `strs` contains duplicates. If having checked all elements we haven't found any uncommon
    //sequences we return -1.
    func findLUSlength(_ strs: [String]) -> Int {
        let strs = strs.sorted { $0.count > $1.count }
        
        for (i, a) in strs.enumerated() {
            var foundSubsequence = false
            
            for (j, b) in strs.enumerated() { //can't start at i as `strs` contains duplicates
                guard i != j else {
                    continue
                }
                
                guard b.count >= a.count else { //`b` needs to be at least as long as `a`
                    break
                }
                
                if isSubsequence(a, of: b) {
                    foundSubsequence = true
                    break
                }
            }
            
            if !foundSubsequence {
                return a.count
            }
        }
        
        return -1
    }
    
    private func isSubsequence(_ a: String, of b: String) -> Bool {
        let a = Array(a)
        let b = Array(b)
        
        var p1 = 0
        var p2 = 0
        
        while p1 < a.count {
            while p2 < b.count, a[p1] != b[p2] { //fast forward
                p2 += 1
            }
            
            p1 += 1
            p2 += 1
        }
        
        return p2 <= b.count
    }
}
