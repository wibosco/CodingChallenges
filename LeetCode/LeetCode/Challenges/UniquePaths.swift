// Created 16/03/2022.

import Foundation

//https://leetcode.com/problems/unique-paths/
struct UniquePaths {
    
    //Time: O(n * m) where m is the rows
    //               where n is the columns
    //Space: O(n * m)
    //matrix
    //array
    //graph thoery
    //relative indexing
    //DFS
    //memoization
    //top-down
    //dynamic programming
    //recursive
    //inout
    //
    //Solution Description:
    //Treating the matrix as a grpah we can use relative indexing to move through the possible paths within the graph using DFS.
    //At each cell within the matrix we either go down a row or right a column. We check if doing so are moved `row` or `column`
    //out of the bounds of the matrix. If we are out of bounds, the recursion stops. If we are not out of bounds, we check if
    //`row` and `col` has reached the right-most cell (the target), if we have then we know this path was valid and can return
    //1. We sum all the valid paths to get the numbr of unique paths. To avoid having recalculate the path from already visited
    //cells, we store the total number of paths from a given cell to the target in a memoization dictionary. When the last
    //recursive frame unwinds we can return the total unique paths.
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo = [[Int]: Int]()

        return dfs((m - 1), (n - 1), 0, 0, &memo)
    }

    private func dfs(_ lastRow: Int, _ lastCol: Int, _ row: Int, _ col: Int, _ memo: inout [[Int]: Int]) -> Int {
        guard row <= lastRow, col <= lastCol else {
            return 0
        }

        guard [lastRow, lastCol] != [row, col] else {
            return 1
        }

        guard memo[[row, col]] == nil else {
            return memo[[row, col]]!
        }
        
        //notice we take two paths here
        let total = dfs(lastRow, lastCol, (row + 1), col, &memo) + dfs(lastRow, lastCol, row, (col + 1), &memo)

        memo[[row, col]] = total
        
        return total
    }
    
    //Time: O(n * m) where m is the rows
    //               where n is the columns
    //Space: O(n * m)
    //matrix
    //dynamic programming
    //graph thoery
    //
    //Solution Description:
    //Iterating through the matrix we can generate the count of the possible paths to any given cell by taking the possible
    //paths to the cell in the row directly above and the possible paths to the cell directly to the left and adding them.
    //We can repeat this process until we reach the target cell (bottom right) at which point we will have the number of
    //possible paths.
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
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
    //graph thoery
    //DFS
    //backtracking
    //relative indexing
    //recursive
    //inout
    //
    //Solution Description:
    //Starting from `0, 0` we use backtracking to move through the matrix. At each cell we attempt to make one of two moves
    //(in different branches): `down` and `right`. With both of these moves we check if the to-moved-to-cell is in the
    //bounds of the matrix i.e. for `down`, row is less than the row count and for `right`, column is less then the column
    //count. We repeat these moves until either we reach the target (`m - 1, n - 1`) at which time we increment `count` or
    //we can't take any more moves on our current branch and so abandon it.
    func uniquePaths3(_ m: Int, _ n: Int) -> Int {
        var paths = 0
        
        dfs(m, n, 0, 0, &paths)
        
        return paths
    }
    
    private func dfs(_ m: Int, _ n: Int, _ r: Int, _ c: Int, _ paths: inout Int) {
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
