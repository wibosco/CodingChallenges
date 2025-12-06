// Created 13/03/2022.

import Foundation

//https://leetcode.com/problems/spiral-matrix/
struct SpiralMatrix {
    private enum Direction {
        case up
        case down
        case left
        case right
    }
    
    //Time: O(n * m) where n is the number of rows in `matrix`
    //               where m is the number of columns in `matrix`
    //Space: O(n * m)
    //matrix
    //graph
    //visited
    //relative indexing
    //inout
    //
    //Solution Description:
    //A spiral will go right -> down -> left -> up, until all cells have been visited, this means that if we hit a boundary
    //we move onto the next direction e.g. from travelling `right` to `down`. There are two types of boundaries: the edges of
    //the matrix and hitting an already visited cell. So we have a state machine that will change direction when needed and we
    //know the maximum number of possible moves (the number of cells in `matrix`) so all that is left so for us to track the
    //cells that have been visited in `visited`, append the current cells value to `order` and decrement `possibleMoves` until
    //all cells have been visited.
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
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
    
    private func nextMove(_ matrix: [[Int]], _ row: Int, _ column: Int, _ direction: inout Direction, _ visited: Set<[Int]>) -> [Int] {
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
    
    //Time: O(n * m) where n is the number of rows in `matrix`
    //               where m is the number of columns in `matrix`
    //Space: O(n * m)
    //matrix
    //graph
    //visited
    //relative indexing
    //inout
    //
    //Solution Description:
    //A spiral will go right -> down -> left -> up, until all cells have been visited, this means that if we hit a boundary
    //we move onto the next direction e.g. from travelling `right` to `down`. Treating the matrix as multiple circuits we can
    //gradually contract the boundaries of the matrix to force the matrix traversal onto different circuits. Each circuit is
    //performed using DFS. Within each circuit when we encounter a boundary we switch direction. To ensure that we don't
    //enter an infinite cycle we use a visited set to know when we reach the start of the ciruite again. When a circuit
    //completes we move the boundaries of the next inwards. When `order` has a count that matches the matrix count then we
    //can return `order`.
    func spiralOrder2(_ matrix: [[Int]]) -> [Int] {
        var order = [Int]()
        var visited = Set<[Int]>()

        var leftEdge = 0
        var rightEdge = matrix[0].count
        var topEdge = 0
        var bottomEdge = matrix.count

        while order.count < (matrix.count * matrix[0].count) {
            dfs(matrix, leftEdge, topEdge, leftEdge, rightEdge, topEdge, bottomEdge, &order, &visited)

            leftEdge += 1
            rightEdge -= 1
            topEdge += 1
            bottomEdge -= 1
        }

        return order
    }

    private func dfs(_ matrix: [[Int]], _ r: Int, _ c: Int, _ leftEdge: Int, _ rightEdge: Int, _ topEdge: Int, _ bottomEdge: Int, _ order: inout [Int], _ visited: inout Set<[Int]>) {
        guard r >= topEdge, r < bottomEdge, c >= leftEdge, c < rightEdge else {
            return
        }

        guard !visited.contains([r, c]) else {
            return
        }
        visited.insert([r, c])
        order.append(matrix[r][c])

        //order of checking if important to ensure that the movements are made in the correct order
        if r == topEdge && c != (rightEdge - 1) {
            dfs(matrix, r, c + 1, leftEdge, rightEdge, topEdge, bottomEdge, &order, &visited)
        } else if c == (rightEdge - 1) && r != (bottomEdge - 1) {
            dfs(matrix, r + 1, c, leftEdge, rightEdge, topEdge, bottomEdge, &order, &visited)
        } else if r == (bottomEdge - 1) && c != leftEdge {
            dfs(matrix, r, c - 1, leftEdge, rightEdge, topEdge, bottomEdge, &order, &visited)
        } else if c == leftEdge && r != topEdge {
            dfs(matrix, r - 1, c, leftEdge, rightEdge, topEdge, bottomEdge, &order, &visited)
        }
    }
}
