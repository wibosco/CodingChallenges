//
//  Subsequence.swift
//  Algorithms
//
//  Created by William Boles on 11/07/2023.
//

import Foundation

struct Subsequence {
    
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
    //
    //This forumla calculates the number of possible subsequences:
    //
    //2 ^ characterCount
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
}
