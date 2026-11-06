// Created 06/11/2026.

import Foundation

//https://leetcode.com/problems/longest-common-subsequence/
struct LongestCommonSubsequence {
    
    //Time: O(m * n) where m is the number of characters in `text1`
    //               where n is the number of characters in `text2`
    //Space: O(m * n)
    //string
    //array
    //graph theory
    //dynamic programming
    //memoization
    //top-down
    //DFS
    //recursive
    //inout
    //
    //
    //Solution Description:
    //Treating this like a graph, we can recursively walk through both `text1` and `text2`, comparing the elements at each index
    //path (`i` and `j`) until one of the strings is exhausted. At each recursive frame we compare the current value of `text1`
    //against `text2` if they match we increment both `i` and `j` and recursively compare the next characters. The length of the
    //longest common subsquence is gradually built up with each successfull match and that value is returned as the recursive
    //frames unwind. If the values don't match, we increment one pointer and recursively compare again and then do the same for
    //the other - this ensures that we fully check both paths on a mismatch. For each combination of `i` and `j` pointers we
    //store the best result from those pointers to the end of the search space in a memo table. This allows us to shortcut the
    //search if we end up on the same `i` and `j` combination (via a different path) again. Once either `text1` or `text2` is
    //exhausted we return the longest value.
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var memo = [[Int]: Int]()
    
        return dfs(Array(text1), Array(text2), 0, 0, &memo)
    }

    private func dfs(_ text1: [Character], _ text2: [Character], _ i: Int, _ j: Int, _ memo: inout [[Int]: Int]) -> Int {
        guard i < text1.count, j < text2.count else {
            return 0
        }

        guard memo[[i, j]] == nil else {
            return memo[[i, j]]!
        }

        if text1[i] == text2[j] {
           memo[[i, j]] = dfs(text1, text2, (i + 1), (j + 1), &memo) + 1
        } else {
            memo[[i, j]] = max(dfs(text1, text2, (i + 1), j, &memo), dfs(text1, text2, i, (j + 1), &memo))
        }

        return memo[[i, j]]!
    }
}
