//(
//  SnakesAndLadders.swift
//  LeetCode
//
//  Created by William Boles on 26/10/2023.
//
import Foundation

//https://leetcode.com/problems/snakes-and-ladders/
struct SnakesAndLadders {
    
    //Time: O(n) where n is the number of elements in `board`
    //Space: O(n)
    //graph theory
    //BFS
    //unweighted graph
    //visited
    //queue
    //iterative
    //batching
    //level traversal
    //matrix
    //
    //Solution Description:
    //Treating `board` as a graph we can perform a BFS in order to determine the fewest moves required in order to each the end of
    //the board. First we flatten the board into 1-dimension array which allow for easier movement around the board by reducing the
    //need to move between rows - it's important to note that the order of the movement alternates between rows and we need to take
    //that into account when flattening the board. Next we perform a level traversal of the graph which each level being considered
    //a "move". As it's possible to move between 1 and 6 positions we check for target within that range. If target hasn't been hit
    //we add that new position to the next iteration of the queue. The `visited` set allows us to cut down on the amount of
    //searching by ensuring we only search from position once (apart from 0). If at the end of the BFS we haven't hit `target` then
    //we return -1.
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        var flatBoard = [Int]()
        
        for (i, row) in board.reversed().enumerated() {
            if i % 2 == 0 { //order of row elements alternates with each row
                flatBoard.append(contentsOf: row)
            } else {
                flatBoard.append(contentsOf: row.reversed())
            }
        }
        
        let target = (flatBoard.count - 1)
        
        var queue = [Int]()
        queue.append(0)
        
        var visited = Set<Int>()
        var moves = 0
        
        while !queue.isEmpty {
            var newQueue = [Int]()
            
            for current in queue {
                if visited.contains(current) { //check if we have already got to current with a previous move
                    continue
                }
                
                visited.insert(current)
                
                for roll in 1...6 {
                    var next = current + roll
                    
                    //no need to check for overflow as in order to overflow we would have already hit target
                    
                    if flatBoard[next] > -1 {
                        next = (flatBoard[next] - 1) //zero indexed array vs 1 indexed data
                    }
                    
                    if next == target {
                        return (moves + 1)
                    }
                    
                    newQueue.append(next)
                }
            }
            
            moves += 1
            queue = newQueue
        }
        
        return -1
    }
}
