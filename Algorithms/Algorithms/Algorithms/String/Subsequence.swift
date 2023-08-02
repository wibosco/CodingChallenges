//
//  Subsequence.swift
//  Algorithms
//
//  Created by William Boles on 11/07/2023.
//

import Foundation

struct Subsequence {
    
    // MARK: - Generation
    
    //Time: O(2^n) where n is the number of elements in `s`
    //Space: O(n)
    //DFS
    //recrusive
    //backtracking
    //array
    //string
    //set
    //multi-source
    //n-ary tree
    //subsequence
    //
    //Solution Description:
    //A subsequence is a non-contiguous slice of `s` i.e. while order is preserved some characters can be skipped over. Therefore
    //to generate all subsequences we need to iterate through `s` from every possible position to every possible other position -
    //in a forwards direction. To this we itereate in a DFS manner using backtracking to selected different "next" indexes from
    //the current index. We do this until every possible start position has been fully explored.
    //
    //Subsequences of `abcd`
    //
    //    a
    //    b
    //    c
    //    d
    //    ab
    //    ac
    //    ad
    //    bc
    //    bd
    //    cd
    //    abc
    //    abd
    //    acd
    //    bcd
    //    abcd
    static func generateSubsequences(_ s: String) -> Set<String> {
        var subsequences = Set<String>()
        var subsequence = [Character]()
        
        dfs(Array(s), 0, &subsequence, &subsequences)
        
        return subsequences
    }
    
    private static func dfs(_ characters: [Character], _ index: Int, _ subsequence: inout [Character], _ subsequences: inout Set<String>) {
        guard index < characters.count else {
            return
        }
        
        for i in index..<characters.count { //with a subsequence we can skip over elements but not go backwards
            subsequence.append(characters[i])
            subsequences.insert(String(subsequence))
            dfs(characters, (i + 1), &subsequence, &subsequences)
            subsequence.removeLast()
        }
    }
    
    // MARK: - Count
    
    //Time: O(1)
    //Space: O(1)
    //math
    //subsequence
    //
    //Solution Description:
    //Use a formula to work out the count.
    static func countSubsequences(_ s: String) -> Int {
        return Int(pow(Double(2), Double(s.count))) - 1 //-1 removes the empty subsequence
    }
    
    // MARK: - Check
    
    //Time: O(max(n, m)) where n is the number of elements in `a`, m is the number fo elements in `b`
    //Space: O(1)
    //subsequence
    //nested loops
    //two pointers
    //
    //Solution Description:
    //Using nested loops we iterate through `sub` and attempt for find a match for each character (in order) in `full`. Using two
    //pointers we are able to loop through both strings at different rates - remember a subsequence only needs to keep the relative
    //order of the elements the same, it can omit any elements in between. The outer loop iterates through the elements in `sub` and
    //the inner loop through `full`. If there is a match between `sub` and `full`, then we move onto the next element in `sub` and
    //attempt to find it in `full` - note that `fIndex` isn't reset upon finding a match. If we find all of `sub` in `full` then
    //`sIndex` will be equal to `sub.count` otherwise it won't be so we can use this to return true or false respectively.
    static func isSubsequence(_ sub: String, of full: String) -> Bool {
        let sub = Array(sub)
        let full = Array(full)
        
        var sIndex = 0
        var fIndex = 0
        
        while sIndex < sub.count {
            var match = false
            
            while fIndex < full.count && !match {
                match = (full[fIndex] == sub[sIndex])
                fIndex += 1
            }
            
            if !match {
                break
            }
            
            sIndex += 1
        }
        
        return sIndex == sub.count
    }
}
