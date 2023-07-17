//
//  Substring.swift
//  Algorithms
//
//  Created by William Boles on 11/07/2023.
//

import Foundation

struct Substring {
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //DFS
    //recrusive
    //array
    //subarray
    //string
    //set
    //multi-source
    //n-ary tree
    //
    //Solution Description:
    //A substring is contiguous slice of `s` i.e. order is preserved with no characters skipped over (from the start to end of
    //that substring). Therefore to generate all substrings we need to iterate through all possible starting indexes of `s`
    //and take each starting position to the end of `s` - it's important to note that we only ever move forwards, never
    //backwards. Each new element we encounter we add to our substring and store that addition in `substrings` as it own unique
    //substring - a substring doesn't need to use all characters in `s`.
    //
    //Substrings of `abcd`
    //
    //    a
    //    b
    //    c
    //    d
    //    ab
    //    bc
    //    cd
    //    abc
    //    bcd
    //    abcd
    //
    //This forumla calculates the number of possible substrings:
    //
    //characterCount * (characterCount + 1) / 2
    static func generateSubstrings(_ s: String) -> Set<String> {
        var substrings = Set<String>()
        let characters = Array(s)
        
        for i in 0..<characters.count {
            dfs(characters, i, [], &substrings)
        }
        
        return substrings
    }
        
    private static func dfs(_ characters: [Character], _ index: Int, _ substring: [Character], _ substrings: inout Set<String>) {
        guard index < characters.count else {
            return
        }
    
        let nextSubstring = substring + [characters[index]]
        substrings.insert(String(nextSubstring))
        dfs(characters, (index + 1), nextSubstring, &substrings)
    }
}
