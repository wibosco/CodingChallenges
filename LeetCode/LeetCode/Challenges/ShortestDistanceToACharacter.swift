//
//  ShortestDistanceToACharacter.swift
//  LeetCode
//
//  Created by William Boles on 10/06/2024.
//

import Foundation

//https://leetcode.com/problems/shortest-distance-to-a-character/
struct ShortestDistanceToACharacter {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Uses two passes, on the first pass we calculate the distance from any given index to an earlier (lower index) `c`
    //element; on the second pass we calculate the distance from any given index to a later (higher index) `c` element. On
    //the second pass we compare the current value in `distances` and only take the smaller of the two disances. Before we
    //find the first instance of `c` in either iteration the distance is infinity (expressed here a `Int.max`), once we
    //find `c` we set `distanceFromC` and start incrementing that distance with each iteration - whenever we find a new
    //instance of `c` we reset `distanceFromC` back to 0. Once both passes are complete we return `distances`.
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let chars = Array(s)
        var distances = [Int]()
        
        var distanceFromC = Int.max
        for char in chars {
            if char == c {
                distanceFromC = 0
            }
            
            distances.append(distanceFromC)
            
            if distanceFromC != Int.max {
                //have found `c` already so increment
                distanceFromC += 1
            }
        }
        
        distanceFromC = Int.max //reset as we are now going right-to-left
        for (index, char) in chars.enumerated().reversed() {
            if char == c {
                distanceFromC = 0
            }
            
            distances[index] = min(distanceFromC, distances[index])
            
            if distanceFromC != Int.max {
                //have found `c` already so increment
                distanceFromC += 1
            }
        }
        
        return distances
    }
    
    //Time: O(n^2) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //string
    //graph theory
    //multi-source
    //BFS
    //set
    //visited
    //inout
    //
    //Solution Description:
    //Treating `s` as a graph we first find all indexs where `c` is and then perform a BFS from those indexes to all
    //other indexes, we track the level of our BFS and use that to calculate the distance between that index of `c` and
    //the current index. To ensure that we record the shortest distance from any given `c` to an index we use a shared
    //`distances` that is passed in with each new starting index of our BFS.
    func shortestToCharBFS(_ s: String, _ c: Character) -> [Int] {
        let chars = Array(s)
        var starts = Set<Int>()
        
        for (index, char) in chars.enumerated() {
            if char == c {
                starts.insert(index)
            }
        }
        
        var distances = Array(repeating: Int.max, count: chars.count)
        for start in starts {
            bfs(&distances, start)
        }
        
        return distances
    }
    
    private func bfs(_ distances: inout [Int], _ start: Int) {
        var level = 0
        var visited = Set<Int>()
        var queue = [Int]()
        queue.append(start)
        
        while !queue.isEmpty {
            var newQueue = [Int]()
            
            for index in queue {
                guard !visited.contains(index) else {
                    continue
                }
                visited.insert(index)
                
                distances[index] = min(level, distances[index])
                
                let left = index - 1
                let right = index + 1
                
                if left >= 0 {
                    newQueue.append(left)
                }
                
                if right < distances.count {
                    newQueue.append(right)
                }
            }
            
            queue = newQueue
            level += 1
        }
    }
}
