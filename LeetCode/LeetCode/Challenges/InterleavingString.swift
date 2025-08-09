//
//  InterleavingString.swift
//  LeetCode
//
//  Created by William Boles on 24/03/2022.
//

import Foundation

//https://leetcode.com/problems/interleaving-string/
struct InterleavingString {
    
    //Time: O(n + m) where n is the characters in `s1`
    //               where m is the characters in `s2`
    //Space: O(n + m)
    //string
    //set
    //memoization
    //visited
    //top-down
    //dynamic programming
    //recursive
    //DFS
    //binary tree
    //top-down
    //
    //Solution Description:
    //We compare each character of `s1` and `s2` to `s3` in order, in a DFS, recursive manner. If the `s1` character matches
    //`s3` we take it and move the `s1Index` and `s3Index` forward for the next comparison with `s3`; if the `s2` character
    //matches `s3` we take it and move the `s2Index` and `s3Index` forward for the next comparison with `s3; if no character
    //from `s1` or `s2` match then this branch of interleaving is invalid and we abandon it. It's important to note that if
    //both `s1` and `s2` match then we take both - first `s1` then `s2`. To speed up the process (from `2^n+m` to `n+m`) we
    //use memoization (`memo`) so that we don't take paths that have already been taken. If we are able to match all the
    //characters of `s1` and `s2` we exit and return true.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        let chars3 = Array(s3)

        var visited = Set<[Int]>()

        return dfs(chars1, chars2, chars3, 0, 0, 0, &visited)
    }

    private func dfs(_ chars1: [Character], _ chars2: [Character], _ chars3: [Character], _ p1: Int, _ p2: Int, _ p3: Int, _ visited: inout Set<[Int]>) -> Bool {
        guard p3 < chars3.count else {
            return p1 == chars1.count && p2 == chars2.count
        }

        guard !visited.contains([p1, p2, p3]) else {
            return false
        }
        visited.insert([p1, p2, p3])

        let char1 = p1 < chars1.count ? chars1[p1] : "0"
        let char2 = p2 < chars2.count ? chars2[p2] : "0"
        let char3 = chars3[p3]

        if char1 == char3 && char2 == char3 {
            return dfs(chars1, chars2, chars3, (p1 + 1), p2, (p3 + 1), &visited) ||
                    dfs(chars1, chars2, chars3, p1, (p2 + 1), (p3 + 1), &visited)
        } else if char1 == char3 {
            return dfs(chars1, chars2, chars3, (p1 + 1), p2, (p3 + 1), &visited)
        } else if char2 == char3 {
            return dfs(chars1, chars2, chars3, p1, (p2 + 1), (p3 + 1), &visited)
        }

        return false
    }
    
    //Time: O(n + m) where n is the characters in `s1`
    //               where m is the characters in `s2`
    //Space: O(n + m)
    //string
    //set
    //memoization
    //top-down
    //dynamic programming
    //recursive
    //DFS
    //binary tree
    //inout
    //
    //Solution Description:
    //We compare each character of `s1` and `s2` to `s3` in order, in a DFS, recursive manner. If the `s1` character matches
    //`s3` we take it and move the `s1Index` and `s3Index` forward for the next comparison with `s3`; if the `s2` character
    //matches `s3` we take it and move the `s2Index` and `s3Index` forward for the next comparison with `s3; if no character
    //from `s1` or `s2` match then this branch of interleaving is invalid and we abandon it. It's important to note that if
    //both `s1` and `s2` match then we take both - first `s1` then `s2`. To speed up the process (from `2^n+m` to `n+m`) we
    //use memoization (`memo`) so that we don't take paths that have already been taken with the `s1Index` and `s2Index` as
    //keys. If we are able to match all the characters of `s1` and `s2` we exit and return true.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard (s1.count + s2.count) == s3.count else {
            return false
        }
        
        var found = false
        var memo = Set<[Int]>()
        
        interleave(Array(s1), 0, Array(s2), 0, Array(s3), 0, &found, &memo)
        
        return found
    }
    
    private func interleave(_ s1: [Character], _ s1Index: Int, _ s2: [Character], _ s2Index: Int, _ s3: [Character], _ s3Index: Int, _ found: inout Bool, _ memo: inout Set<[Int]>) {
        guard found != true else {
            return
        }
        
        //check if we have already went down the `[s1Index, s2Index]` branch and can just abort
        guard !memo.contains([s1Index, s2Index]) else {
            return
        }
        
        if s1Index == s1.count && s2Index == s2.count {
            found = true
            return
        }
        
        if s1Index < s1.count {
            if s3[s3Index] == s1[s1Index] {
                memo.insert([s1Index, s2Index])
                interleave(s1, (s1Index + 1), s2, s2Index, s3, (s3Index + 1), &found, &memo)
            }
        }
        
        if s2Index < s2.count {
            if s3[s3Index] == s2[s2Index] {
                memo.insert([s1Index, s2Index])
                interleave(s1, s1Index, s2, (s2Index + 1), s3, (s3Index + 1), &found, &memo)
            }
        }
    }
}
