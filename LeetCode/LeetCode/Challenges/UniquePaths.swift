//
//  UniquePaths.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/unique-paths/
//matrix
struct UniquePaths {
    
    //Time: O(n * m) where `m` is the rows and `n` is the columns
    //Space: O(n * m) where `m` is the rows and `n` is the columns
    //dynamic programming
    //
    //Solution Description:
    //Iterating through the matrix we egt the possible paths to this cell together by taking the row above and column
    //to the left and adding them. We repeat this until we reach the final cell at which point we will have the
    //number of possible paths.
    static func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for r in 1..<m { //notice we don't start at 0 as they are already filled with 1
            for c in 1..<n {
                matrix[r][c] = matrix[(r - 1)][c] + matrix[r][(c - 1)]
            }
        }
        
        return matrix[(m - 1)][(n - 1)]
    }
    
    //Time: O((m * n)!) where `m` is the rows and `n` is the columns
    //Space: O(1)
    //DFS
    //
    //Solution Description:
    //Treating the matrix as a graph we use DFS to generate all possible paths from `0, 0` to `m - 1, n - 1`.
    static func uniquePathsDFS(_ m: Int, _ n: Int) -> Int {
        var paths = 0
        
        dfs(m, n, 0, 0, &paths)
        
        return paths
    }
    
    private static func dfs(_ m: Int, _ n: Int, _ r: Int, _ c: Int, _ paths: inout Int) {
        if r == (m - 1) && c == (n - 1) {
            paths += 1
            return
        }
        
        if (r + 1) < m {
            dfs(m, n, (r + 1), c, &paths)
        }
        
        if (c + 1) < n {
            dfs(m, n, r, (c + 1), &paths)
        }
    }
}
