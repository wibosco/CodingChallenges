//
//  PalindromePartitioning.swift
//  LeetCode
//
//  Created by William Boles on 02/07/2023.
//

import Foundation

//https://leetcode.com/problems/palindrome-partitioning/
struct PalindromePartitioning {
    
    //Time: O(n * 2^n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //DFS
    //backtracking
    //graph theory
    //recursive
    //multi-source
    //two pointers
    //
    //Solution Description:
    //Treating `s` as a graph/tree we can use backtracking (DFS) to find palindromes from all possible substrings of `s`
    //and from there all possible palindromes that come off of that starting palindrome. We repeat this process until we
    //reach the end of `characters`. Once reaching the end of `characters` we check if this branch result in any
    //palindromes and if all characters where used in those palindromes. If both those conditions are true we add
    //`palindromes` to `result`. Once we reach the end of one recursive branch we then backtrack to the nearest (latest)
    //valid palindrome and attempt to find another valid path by adding to that palindrome and searching down the
    //graph/tree from that new position. We repeat this process until all possible branches have been searched.
    static func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        
        dfs(Array(s), 0, 0, [], &result)
        
        return result
    }
    
    private static func dfs(_ characters: [Character], _ start: Int, _ end: Int, _ palindromes: [String], _ result: inout [[String]]) {
        guard end < characters.count else { //goal
            guard !palindromes.isEmpty, start == end else {
                return
            }
            result.append(palindromes)
            return
        }
        
        if isPalindrome(characters, start, end) { //constraint
            let newPalindromes = palindromes + [String(characters[start...end])]
            let newIndex = end + 1
            
            //found palindrome so add it to array and search for next palindrome
            dfs(characters, newIndex, newIndex, newPalindromes, &result)
            //backtrack after this by calling `dfs` without `newPalindromes`
        }
        
        //continue search for palindrome by expanding current "word"
        dfs(characters, start, (end + 1), palindromes, &result)
    }
    
    private static func isPalindrome(_ characters: [Character], _ start: Int, _ end: Int) -> Bool {
        var p1 = start
        var p2 = end
            
        while p1 < p2 {
            if characters[p1] != characters[p2] {
                return false
            }
            
            p1 += 1
            p2 -= 1
        }
        
        return true
    }
}
