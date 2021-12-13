//
//  PerfectSquares.swift
//  CodingChallenges
//
//  Created by William Boles on 13/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/perfect-squares/
//graph theory
struct PerfectSquares {
    
    //Time: O()
    //Space: O()
    //BFS
    //Set
    //
    //Solution Description:
    //First build a set with all possible squares up to `n`. Then using these squares perform
    //a BFS with the queue hold the running total of each branch - the square itself is seeded
    //with the squares. As we are only interested in the total and not the path, the queue can
    //be set so that if two branches have the same total they are effectively merged - this will
    //significantly speed up the BFS. The neighbor of each total is the `squares` set. If during
    //a level the total exceeds `n`, that branch is discarded.
    static func numSquares(_ n: Int) -> Int {
        var squares = Set<Int>()
        var i = 1
        while (i * i) <= n {
            let square = i * i
            
            if square == n {
                return 1
            }
            
            squares.insert(square)
            
            i += 1
        }
    
        var queue = squares //our queue is only for unique totals at each level
        var level = 1
        
        while !queue.isEmpty {
            //as we are iterating a set we can't add items to the end of the queue
            //as we build up the next level and  have them not interfere with the
            //current level. Instead each level needs its own queue to add to.
            var newQueue = Set<Int>()
            level += 1
            
            while !queue.isEmpty {
                let total = queue.removeFirst()
                
                for square in squares {
                    let newTotal = total + square
                    
                    guard newTotal != n else {
                        return level
                    }
                    
                    guard newTotal < n else {
                        continue
                    }
                    
                    newQueue.insert(newTotal)
                }
            }
            
            queue = newQueue
        }
        
        return level
    }
}
