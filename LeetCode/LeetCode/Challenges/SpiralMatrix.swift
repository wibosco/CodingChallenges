//
//  SpiralMatrix.swift
//  LeetCode
//
//  Created by William Boles on 13/03/2022.
//

import Foundation

//https://leetcode.com/problems/spiral-matrix/
//matrix
struct SpiralMatrix {
    private enum Direction {
        case up
        case down
        case left
        case right
    }
    
    //Time: O(n * m) where n is the number of rows in `matrix,` m is the number of columns in `matrix`
    //Space: O(n * m) where n is the number of rows in `matrix,` m is the number of columns in `matrix`
    //graph
    //visited
    //relative indexing
    //
    //Solution Description:
    //A spiral will go right -> down -> left -> up, until all cells have been visited, this means that if we hit a boundary
    //we move onto the next direction e.g. from traveling `right` to `down`. There are two types of boundaries: the edges of
    //the matrix and hitting an already visited cell. So we have astate machine that will change direction when needed and we
    //know the maximum number of possible moves (the number of cells in `matrix`) so all that is left so for us to track the
    //cells that have been visited in `visited`, append the current cells value to `order` and decrement `possibleMoves` until
    //all cells have been visited.
    static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var possibleMoves = (matrix.count * matrix[0].count) - 1
        var visited = Set<[Int]>()
        visited.insert([0, 0])
        var order = [matrix[0][0]]
        var currentIndex = [0, 0]
        var direction: Direction = .right
        
        while possibleMoves > 0 {
            let nextIndex = nextMove(matrix, currentIndex[0], currentIndex[1], &direction, visited)
            
            visited.insert(nextIndex)
            
            let value = matrix[nextIndex[0]][nextIndex[1]]
            order.append(value)
            
            possibleMoves -= 1
            currentIndex = nextIndex
        }
        
        return order
    }
    
    private static func nextMove(_ matrix: [[Int]], _ row: Int, _ column: Int, _ direction: inout Direction, _ visited: Set<[Int]>) -> [Int] {
        switch direction {
        case .right:
            let nextIndex = [row, (column + 1)]
            if visited.contains(nextIndex) || nextIndex[1] >= matrix[row].count {
                //change direction
                direction = .down
                return nextMove(matrix, row, column, &direction, visited)
            } else {
                return nextIndex
            }
        case .down:
            let nextIndex = [(row + 1), column]
            if visited.contains(nextIndex) || nextIndex[0] >= matrix.count {
                //change direction
                direction = .left
                return nextMove(matrix, row, column, &direction, visited)
            } else {
                return nextIndex
            }
        case .left:
            let nextIndex = [row, (column - 1)]
            if visited.contains(nextIndex) || nextIndex[1] < 0 {
                //change direction
                direction = .up
                return nextMove(matrix, row, column, &direction, visited)
            } else {
                return nextIndex
            }
        case .up:
            let nextIndex = [(row - 1), column]
            if visited.contains(nextIndex) || nextIndex[0] < 0 {
                //change direction
                direction = .right
                return nextMove(matrix, row, column, &direction, visited)
            } else {
                return nextIndex
            }
        }
    }
}
