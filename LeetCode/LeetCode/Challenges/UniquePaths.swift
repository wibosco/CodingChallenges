//
//  UniquePaths.swift
//  LeetCode
//
//  Created by William Boles on 16/03/2022.
//

import Foundation

//https://leetcode.com/problems/unique-paths/
struct UniquePaths {
    
    //Time: O(n * m) where m is the rows
    //               where n is the columns
    //Space: O(n * m)
    //matrix
    //dynamic programming
    //
    //Solution Description:
    //Iterating through the matrix we can generate the count of the possible paths to any given cell by taking the possible
    //paths to the cell in the row directly above and the possible paths to the cell directly to the left and adding them.
    //We can repeat this process until we reach the target cell (bottom right) at which point we will have the number of
    //possible paths.
    static func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for r in 1..<m { //notice we don't start at 0 as they are already filled with 1
            for c in 1..<n {
                matrix[r][c] = matrix[(r - 1)][c] + matrix[r][(c - 1)]
            }
        }
        
        return matrix[(m - 1)][(n - 1)]
    }
    
    //Time: O(2^(m * n)) where m is the rows
    //                   where n is the columns
    //Space: O(n * m)
    //matrix
    //DFS
    //backtracking
    //relative indexing
    //recursive
    //
    //Solution Description:
    //Starting from `0, 0` we use backtracking to move through the matrix. At each cell is attempt to make one of two moves
    //(in different branches): `down` and `right`. With both of these moves we check if the to-moved-to-cell is in the
    //bounds of the matrix i.e. for `down`, row is less than the row count and for `right`, column is less then the column
    //count. We repeat these moves until either we reach the target (`m - 1, n - 1`) at which time we increment `count` or
    //we can't take any more moves on our current branch and so abandon it.
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
