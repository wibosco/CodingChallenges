//
//  WordSearch.swift
//  LeetCode
//
//  Created by William Boles on 18/03/2022.
//

import Foundation

//https://leetcode.com/problems/word-search/
//matrix
struct WordSearch {
    static let relativeIndexing = [      [-1, 0],
                                   [0, -1],     [0, 1],
                                         [1, 0]
                                  ]
    
    //Time: O(m*n*3^l) where `m` is number of rows, `n` is the number of columns and `l` is the length of `word` (there
    //                 are 3 possible indexes off the current index)
    //Space: O(l) where `l` is the lenght of `word` and represents the depth of the recursive stack and `visited`
    //backtracking
    //relative indexing
    //recursive
    //multi-source
    //visited
    //
    //Solution Description:
    //Using a backtracking approach we loop through all possible starting indexes in `board` and attempt to find `word` from
    //there. Using relative indexing we check if any of th neighbor cells to the current cell are valid for where we are in
    //our search for `word`. If a neighbor is valid we move onto that cell and repeat the process for the next letter in
    //`word` (using DFS). As we search we fill up `visited` with the path we have taken whenever we abandon a branch we
    //remove entries from visited until we either find an alternatve branch or run out of cells. This backtracking of
    //`visited` is needed to ensure that we don't block off any new branches because we visited that cell in an older,
    //invalid branch.
    static func exist(_ board: [[Character]], _ word: String) -> Bool {
        var exists = false
        var visited = Set<[Int]>()
        let characters = Array(word)
        
        //any cell in `board` is a potential starting point for `word`
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                let val = board[i][j]
                if val == characters[0] {
                    visited.insert([i, j])
                    backtrack(board, i, j, characters, 1, &visited, &exists)
                    visited.remove([i, j])
                    
                    if exists {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    private static func backtrack(_ board: [[Character]], _ row: Int, _ column: Int, _ word: [Character], _ wordIndex: Int, _ visited: inout Set<[Int]>, _ exists: inout Bool) {
        guard exists != true else {
            return
        }
        
        guard wordIndex < word.count else { //we have found all of `word`
            exists = true
            return
        }
        
        let neighbors = navigatableNeighbors(board, row, column, word[wordIndex], &visited)
        
        for neighbor in neighbors {
            guard exists != true else {
                return
            }
            
            visited.insert([neighbor[0], neighbor[1]])
            backtrack(board, neighbor[0], neighbor[1], word, (wordIndex + 1), &visited, &exists)
            visited.remove([neighbor[0], neighbor[1]]) //this index might be used in a later branch if letters are repeated
        }
    }
    
    private static func navigatableNeighbors(_ board: [[Character]], _ row: Int, _ column: Int, _ match: Character, _ visited: inout Set<[Int]>) -> [[Int]] {
        var neighbors = [[Int]]()
        
        for relativeIndex in relativeIndexing {
            let newRow = row + relativeIndex[0]
            let newColumn = column + relativeIndex[1]
            
            guard newRow >= 0, newRow < board.count else {
                continue
            }
            
            guard newColumn >= 0, newColumn < board[newRow].count else {
                continue
            }
            
            let val = board[newRow][newColumn]
            
            guard val == match else {
                continue
            }
            
            let newIndex = [newRow, newColumn]
            
            guard !visited.contains(newIndex) else {
                continue
            }
            
            neighbors.append(newIndex)
        }
        
        return neighbors
    }
}
