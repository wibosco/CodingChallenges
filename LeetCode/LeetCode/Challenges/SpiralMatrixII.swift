// Created 15/03/2022.

import Foundation

//https://leetcode.com/problems/spiral-matrix-ii/
struct SpiralMatrixII {
    private enum Direction {
        case right
        case down
        case left
        case up
    }
    
    //Time: O(n^2) where n is the number of cells in the matrix
    //Space: O(n^2)
    //matrix
    //
    //Solution Description:
    //By squaring `n` we know how many cells the matrix will contain so we can create an empty matrix of that size. We then
    //iterate through that empty matrix filling any empty cells (with a value of `0`) that we encounter with the next matrix
    //value. As we want to iterate in a spiral fashion for the outer cells we can use the matrix boundaries themselves to
    //know when to change direction then as we move from the outer cells to internal cells we can use the cells value to
    //know when to change direction i.e. value > 0 we change. Eventually we will have filled in all the cells in the matrix
    //and can return it
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        let totalCells = n * n
        
        var visited = 0
        var direction = Direction.right
        var index = [0, -1] //[row, column]
        
        while visited < totalCells {
            switch direction {
            case .right:
                let nextRow = index[0]
                let nextColumn = (index[1] + 1)
                
                if (nextColumn < n) && (matrix[nextRow][nextColumn] == 0) {
                    visited += 1
                    matrix[nextRow][nextColumn] = visited
                    index = [nextRow, nextColumn]
                } else {
                    direction = .down
                }
            case .down:
                let nextRow = (index[0] + 1)
                let nextColumn = index[1]
                
                if (nextRow < n) && (matrix[nextRow][nextColumn] == 0) {
                    visited += 1
                    matrix[nextRow][nextColumn] = visited
                    index = [nextRow, nextColumn]
                } else {
                    direction = .left
                }
            case .left:
                let nextRow = index[0]
                let nextColumn = (index[1] - 1)
                
                if (nextColumn >= 0) && (matrix[nextRow][nextColumn] == 0) {
                    visited += 1
                    matrix[nextRow][nextColumn] = visited
                    index = [nextRow, nextColumn]
                } else {
                    direction = .up
                }
            case .up:
                let nextRow = (index[0] - 1)
                let nextColumn = index[1]
                
                if (nextRow >= 0) && (matrix[nextRow][nextColumn] == 0) {
                    visited += 1
                    matrix[nextRow][nextColumn] = visited
                    index = [nextRow, nextColumn]
                } else {
                    direction = .right
                }
            }
        }
        
        return matrix
    }
}
