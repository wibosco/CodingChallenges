//
//  OpenTheLock.swift
//  LeetCode
//
//  Created by William Boles on 13/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/open-the-lock/
//graph theory
struct OpenTheLock {
    
    //Time: O(
    //Space: O(
    //BFS
    //dynamic vertices
    //
    //Solution Description:
    //Treating each possible lock combination as vertices in a graph, we are able to perform a BFS through the graph to find the
    //shortest path. Rather than build the 10_000 possible vertices before initiating the BFS we can instead create the neighbors
    //of any given combination on demand. We are also able to conbine the `deadends` with the `visited` set to determine whether
    //to continue do that branch or not. After each loop of the BFS we create increment the `level` as we move farther away from
    //"0000"
    static func openLock(_ deadends: [String], _ target: String) -> Int {
        var visited: Set<String> = Set(deadends)
        let start = "0000"
        
        guard !visited.contains(start) else {
            return -1
        }
        
        var queue = [start]
        var level = 0
        while !queue.isEmpty {
            var newQueueItems = [String]()
            
            for combination in queue {
                guard combination != target else {
                    return level
                }
                
                let chars = Array(combination)
                for (index, char) in chars.enumerated() {
                    let rotateUp = char == "9" ? 0 : char.wholeNumberValue! + 1
                    var charsUp = chars
                    charsUp[index] = Character(String(rotateUp))
                    let strCharsUp = String(charsUp)
                    
                    if !visited.contains(strCharsUp) {
                        visited.insert(strCharsUp)
                        newQueueItems.append(strCharsUp)
                    }
                    
                    let rotateDown = char == "0" ? 9 : char.wholeNumberValue! - 1
                    var charsDown = chars
                    charsDown[index] = Character(String(rotateDown))
                    let strCharsDown = String(charsDown)
                    
                    if !visited.contains(strCharsDown) {
                        visited.insert(strCharsDown)
                        newQueueItems.append(strCharsDown)
                    }
                }
            }
            
            queue = newQueueItems
            
            level += 1
        }
        
        return -1
    }
}
