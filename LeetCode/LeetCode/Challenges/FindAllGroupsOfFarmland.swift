// Created 06/05/2025.

import Foundation

//https://leetcode.com/problems/find-all-groups-of-farmland/
struct FindAllGroupsOfFarmland {
    
    //Time: O(n * m) where n is the number of rows in `land`
    //               where m is the number of columns in `land`
    //Space: O(n * m)
    //graph theory
    //matrix
    //greedy
    //multi-source
    //relative indexing
    //marking
    //
    //Solution Description:
    //Treating `land` as a graph, we iterate through each element. As we are starting in the top left corner and finishing in
    //the bottom right we know that the first `1` we encounter will be that farms top-left corner. From that top-left corner
    //perform a greedy search to find all connected farmland.  We move downwards and rightwards through the search. Each time
    //we encounter `1` we overwrite it to `0` to ensure that we don't revisit this farm. Once we run out of land in our search
    //`eRow` and `eColumn` will be one beyond the bottom-right corner of the farm. So we decrement these values and store them
    //alongside the top-left coordinates in `farmland`. Once all elements have been checked we return `farmland`.
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        var land = land
        var farmland = [[Int]]()
        
        for sRow in 0..<land.count {
            for sColumn in 0..<land[sRow].count {
                guard land[sRow][sColumn] == 1 else {
                    continue
                }
                
                var eRow = sRow
                var eColumn = sColumn
                
                while eRow < land.count, land[eRow][sColumn] == 1 {
                    //need to reset to ensure we overwrite all land on this farm otherwise we will end
                    //up with false farms
                    eColumn = sColumn
                    while eColumn < land[eRow].count, land[eRow][eColumn] == 1 {
                        land[eRow][eColumn] = 0
                        eColumn += 1
                    }
                    eRow += 1
                }
                
                farmland.append([sRow, sColumn, (eRow - 1), (eColumn - 1)])
            }
        }
        
        return farmland
    }
    
    //Time: O(n * m) where n is the number of rows in `land`
    //               where m is the number of columns in `land`
    //Space: O(n * m)
    //graph theory
    //matrix
    //DFS
    //recursive
    //multi-source
    //relative indexing
    //marking
    //inout
    //
    //Solution Description:
    //Treating `land` as a graph, we iterate through each element. As we are starting in the top left corner and finishing in
    //the bottom right we know that the first `1` we encounter will be that farms top-left corner. From that top-left corner
    //perform a DFS to find all connected farmland. We move downwards and rightwards through the DFS. Each time we encounter
    //`1` we overwrite it to `0` to ensure that we don't revisit this farm. As we perform the DFS we keep track of the
    //bottom-right most element found so far in `end`. Once we run out of land in our DFS we store the top-left coordinates
    //alongside the bottom-right coordinates in `farmland`. Once all elements have been checked we return `farmland`.
    func findFarmland3(_ land: [[Int]]) -> [[Int]] {
        var land = land
        var farmland = [[Int]]()
        
        for row in 0..<land.count {
            for column in 0..<land[row].count {
                guard land[row][column] == 1 else {
                    continue
                }
                
                var end = [row, column]
                dfs(&land, row, column, &end)
                
                farmland.append([row, column, end[0],end[1]])
            }
        }
        
        return farmland
    }
    
    private func dfs(_ land: inout [[Int]], _ row: Int, _ column: Int, _ end: inout [Int]) {
        guard row >= 0, row < land.count, column >= 0, column < land[row].count else {
            return
        }
        
        guard land[row][column] == 1 else {
            return
        }
        land[row][column] = 0
        
        if row >= end[0] && column >= end[1] {
            end = [row, column]
        }
        
        dfs(&land, (row + 1), column, &end)
        dfs(&land, row, (column + 1), &end)
    }
}
