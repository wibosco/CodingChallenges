//
//  PacificAtlanticWaterFlow.swift
//  LeetCode
//
//  Created by William Boles on 12/04/2023.
//

import Foundation

//https://leetcode.com/problems/pacific-atlantic-water-flow/
struct PacificAtlanticWaterFlow {
    
    //Time: O(n * m) where n is the number of rows in `heights`
    //               where m is the number of columns in `heights`
    //Space: O(n + m)
    //graph theory
    //visited
    //DFS
    //relative indexing
    //matrix
    //recursive
    //multi-source
    //inout
    //two passes
    //
    //Solution Description:
    //Rather than determine if every cell can reach the oceans, we can instead reverse it and see how far the oceans can reach
    //in land - rather than looking for land which is lower, we instead look for land which is higher. We can then take these
    //ocean-reachable cells and see if there is any overlap between those cells that can reach the Pacific and those that can
    //reach the Atlantic. As a starting point we know that all cells that border the matrix can reach at least one of the two
    //oceans so we take each cell on the border and perform a DFS from that cell. As we discover new reachable cells we add
    //them to each reachable set which will allow us to know not only  which cells are common but also avoid re-visiting cells.
    //We use relative-indexing to determine which cells we can move to. As we are going ocean-in rather than cell-out we
    //reverse the height constraint so that we are looking to move to cells that have a value less than or equal to the current
    //cell.
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var canReachPacific = Set<[Int]>()
        var canReachAtlantic = Set<[Int]>()
        
        //search from left and right columns
        for r in 0..<heights.count {
            dfs(heights, r, 0, 0, &canReachPacific)
            dfs(heights, r, (heights[r].count - 1), 0, &canReachAtlantic)
        }
        
        //search from top and bottom rows
        for c in 0..<heights[0].count {
            dfs(heights, 0, c, 0, &canReachPacific)
            dfs(heights, (heights.count - 1), c, 0, &canReachAtlantic)
        }

        return Array(canReachAtlantic.intersection(canReachPacific))
    }

    private func dfs(_ heights: [[Int]], _ r: Int, _ c: Int, _ value: Int, _ visited: inout Set<[Int]>) {
        guard r >= 0, r < heights.count, c >= 0, c < heights[r].count else {
            return
        }

        guard heights[r][c] >= value else {
            return
        }

        guard !visited.contains([r, c]) else {
            return
        }
        visited.insert([r, c])
        
        //relative indexing
        dfs(heights, r + 1, c, heights[r][c], &visited)
        dfs(heights, r - 1, c, heights[r][c], &visited)
        dfs(heights, r, c + 1, heights[r][c], &visited)
        dfs(heights, r, c - 1, heights[r][c], &visited)
    }
    
    //Time: O(n * m) where n is the number of rows in `heights`
    //               where m is the number of columns in `heights`
    //Space: O(n + m)
    //graph theory
    //visited
    //DFS
    //relative indexing
    //matrix
    //recursive
    //multi-source
    //inout
    //two passes
    //
    //Solution Description:
    //Rather than determine if every cell can reach the oceans, we can instead reverse it and see how far the oceans can reach
    //in land. We can then take these ocean-reachable cells and see if there is any overlap between those cells that can reach
    //the Pacific and those that can reach the Atlantic. As a starting point we know that all cells that border the matrix can
    //reach at least one of the two oceans so we take each cell on the border and perform a DFS from that cell. As we discover
    //new reachable cells we add them to the `reachable` set which will allow us to know not only which cells are common but
    //also avoid visiting cells that we have already been to. We use relative-indexing to determine which cells we can move to.
    //As we are going ocean-in rather than cell-out we reverse the height constraint so that we are looking to move to cells
    //that have a value less than or equal to the current cell.
    func pacificAtlantic2(_ heights: [[Int]]) -> [[Int]] { //[row, column]
        var pacificReachable = Set<[Int]>()
        var atlanticReachable = Set<[Int]>()
        
        //rows
        for row in 0..<heights.count {
            //pacific is left, atlantic is right
            dfs(heights, row, 0, &pacificReachable)
            dfs(heights, row, (heights[0].count - 1), &atlanticReachable)
        }
        
        //columns
        for column in 0..<heights[0].count {
            //pacific is above, atlantic is below
            dfs(heights, 0, column, &pacificReachable)
            dfs(heights, (heights.count - 1), column, &atlanticReachable)
        }
        
        let common = atlanticReachable.intersection(pacificReachable)
        
        return Array(common)
    }
    
    private func dfs(_ heights: [[Int]], _ row: Int, _ column: Int, _ reachable: inout Set<[Int]>) {
        guard !reachable.contains([row, column]) else {
            return
        }
        
        reachable.insert([row, column])
        
        let neighbors = dfsNavigatableNeighbors(heights, row, column)
        
        for neighbor in neighbors {
            dfs(heights, neighbor[0], neighbor[1], &reachable)
        }
    }
    
    private func dfsNavigatableNeighbors(_ heights: [[Int]], _ row: Int, _ column: Int) -> [[Int]] {
        // swiftlint:disable comma
        let relativeIndexing = [       [0, -1],
                                [-1, 0],    [1, 0],
                                       [0, 1]
        ]
        // swiftlint:enable comma
        
        var neighbors = [[Int]]()
        
        for relativeIndex in relativeIndexing {
            let newRow = row + relativeIndex[0]
            let newColumn = column + relativeIndex[1]
            
            let newIndex = ([newRow, newColumn])
            
            guard newRow >= 0, newRow < heights.count else {
                continue
            }
            
            guard newColumn >= 0, newColumn < heights[0].count else {
                continue
            }
            
            let currentHeight = heights[row][column]
            let neighborHeight = heights[newRow][newColumn]
            
            guard currentHeight <= neighborHeight else {
                continue
            }
            
            neighbors.append(newIndex)
        }
        
        return neighbors
    }
    
    //Time: O(n * m)^2 where n is the number of rows in `heights`
    //                 where m is the number of columns in `heights`
    //Space: O(n * m)
    //visited
    //DFS
    //relative indexing
    //matrix
    //recursive
    //multi-source
    //inout
    //
    //Solution Description:
    //We perform a DFS from every cell in `heights`, checking if that cell can reach both the Pacific and Atlantic oceans.
    //As the pacific ocean is above and to the left of the matrix, if our DFS reaches the first row or column then we mark
    //that cell as "Pacific ocean reachable"; as the Atlantic ocean is below and to the right of the matrix, if our DFS
    //reach the final row or column then we mark that as "Atlantic ocean reachable". We don't exit upon finding an ocean
    //as it's possible the the matrix might require traversing one border to reach the other ocean. We use relative
    //indexing to determine which cells we can move to. To avoid an infinite loop we use a `visited` set so that we don't
    //visited the same cell twice in that DFS iteration. If both oceans are reachable from a cell we add it to `reachBoth`.
    //Once all cells have used a starting point, we return `reachBoth`.
    func pacificAtlantic3(_ heights: [[Int]]) -> [[Int]] { //[row, column]
        var reachBoth = [[Int]]()
        
        for row in 0..<heights.count {
            for column in 0..<heights[row].count {
                var visited = Set<[Int]>()
                var canReachPacificOcean = false
                var canReachAtlanticOcean = false
                
                if canReachOceans(heights, row, column, &visited, &canReachPacificOcean, &canReachAtlanticOcean) {
                    reachBoth.append([row, column])
                }
            }
        }
        
        return reachBoth
    }
    
    private func canReachOceans(_ heights: [[Int]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>, _ canReachPacificOcean: inout Bool, _ canReachAtlanticOcean: inout Bool) -> Bool {
        if row == 0 || column == 0 {
            canReachPacificOcean = true
        }
        
        if row == (heights.count - 1) || column == (heights[0].count - 1) {
            canReachAtlanticOcean = true
        }
        
        if canReachPacificOcean && canReachAtlanticOcean {
            return true
        }
        
        let neighbors = navigatableNeighbors(heights, row, column, &visited)
        
        for neighbor in neighbors {
            let canReach = canReachOceans(heights, neighbor[0], neighbor[1], &visited, &canReachPacificOcean, &canReachAtlanticOcean)
            if canReach {
                return true
            }
        }
        
        return false
    }
    
    private func navigatableNeighbors(_ heights: [[Int]], _ row: Int, _ column: Int, _ visited: inout Set<[Int]>) -> [[Int]] {
        // swiftlint:disable comma
        let relativeIndexing = [       [0, -1],
                                [-1, 0],    [1, 0],
                                       [0, 1]
        ]
        // swiftlint:enable comma
        
        var neighbors = [[Int]]()
        
        for relativeIndex in relativeIndexing {
            let newRow = row + relativeIndex[0]
            let newColumn = column + relativeIndex[1]
            
            guard !visited.contains([newRow, newColumn]) else {
                continue
            }
            
            guard newRow >= 0, newRow < heights.count else {
                continue
            }
            
            guard newColumn >= 0, newColumn < heights[0].count else {
                continue
            }
            
            let currentHeight = heights[row][column]
            let neighborHeight = heights[newRow][newColumn]
            
            guard currentHeight >= neighborHeight else {
                continue
            }
            
            let newIndex = ([newRow, newColumn])
            
            visited.insert(newIndex)
            neighbors.append(newIndex)
        }
        
        return neighbors
    }
}
