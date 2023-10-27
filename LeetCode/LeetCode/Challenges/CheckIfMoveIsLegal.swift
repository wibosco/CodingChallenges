//
//  CheckIfMoveIsLegal.swift
//  LeetCode
//
//  Created by William Boles on 27/10/2023.
//

import Foundation

//https://leetcode.com/problems/check-if-move-is-legal/
struct CheckIfMoveIsLegal {
    
    //Time: O(1) as it's a fixed size grid
    //Space: O(1)
    //graph theory
    //DFS
    //recursive
    //relative indexing
    //
    //Solution Description:
    //We "color" the square we are given, and then, using relative indexing, we sequentially search all possible lines from
    //that square to determine if any pass the given criteria for a good/valid line. The search of a line happens
    //recursively until we determine if that line is good/valid. To avoid over searching, when we find one good/valid line,
    //we immediately return.
    static func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
        //up, down, left, right, upDiagonalLeft, upDiagonalRight, downDiagonalLeft, downDiagonalRight
        let relativeIndexes = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
        
        for relativeIndex in relativeIndexes {
            let rNext = rMove + relativeIndex.0
            let cNext = cMove + relativeIndex.1
            
            if search(board, rNext, cNext, relativeIndex, color, 1) {
                return true
            }
        }
        
        return false
    }
    
    private static func search(_ board: [[Character]], _ r: Int, _ c: Int, _ relativeIndex: (Int, Int), _ color: Character, _ length: Int) -> Bool {
        if r < 0 || r >= board.count || c < 0 || c >= board[r].count {
            return false
        }
        
        if board[r][c] == "." {
            return false
        }
        
        if board[r][c] == color {
            return length >= 2 //this is the actually the (length + 1) square so check against 2
        }
        
        let rNext = r + relativeIndex.0
        let cNext = c + relativeIndex.1
        
        return search(board, rNext, cNext, relativeIndex, color, (length + 1))
    }
}
