//
//  ShortestPathWithAlternatingColors.swift
//  LeetCode
//
//  Created by William Boles on 30/10/2023.
//

import Foundation

//https://leetcode.com/problems/shortest-path-with-alternating-colors/
struct ShortestPathWithAlternatingColors {
    
    //Time: O(n + e) where n is the number of nodes
    //               where e is the number of edges
    //Space: O(n)
    //graph theory
    //BFS
    //iterative
    //adjacency list
    //queue
    //visited
    //level traversal
    //
    //Solution Description:
    //First we convert the two edge arrays into an adjacency list to allow for easier traversal. We then perform a BFS traversal
    //through our adjacency list attempting to alternate between the color of each path taken, using a level-by-level traversal
    //to determine the distance from node 0. In order to do this we only add neighbor nodes to `queue` if that edge has a
    //different color than the edge we used to get there, this means tha the `queue` holds the current node and the color of the
    //edge that got us to the current node. As this graph might have loops we store the path we have taken in the `visited` set.
    //As this graph can have multiple paths to get to that node and those other paths might be the quickest way to get to that
    //node via a different color edge, when we insert into `visited` we insert both the node itself and the edge color that got
    //us here. As some nodes won't be reachable we default the `distances` array to `-1`. After all paths from node 0 have been
    //search we return `distances`.
    static func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var adjList = Array(repeating: [[Int]](), count: n)
        
        for edge in redEdges {
            let src = edge[0]
            let dst = edge[1]
            
            adjList[src].append([dst, 0]) //0 is red
        }
        
        for edge in blueEdges {
            let src = edge[0]
            let dst = edge[1]
            
            adjList[src].append([dst, 1]) //1 is blue
        }
        
        var visited = Set<[Int]>()
        
        var queue = [[Int]]()
        for neighbor in adjList[0] {
            queue.append(neighbor)
        }
        
        var distances = Array(repeating: -1, count: adjList.count)
        distances[0] = 0
        
        var distance = 1
        while !queue.isEmpty {
            var newQueue = [[Int]]()
            
            for item in queue {
                let currentNode = item[0]
                let fromColor = item[1]
                
                if distances[currentNode] == -1 {
                    distances[currentNode] = distance
                }
                
                for neighbor in adjList[currentNode] {
                    let neighborNode = neighbor[0]
                    let toColor = neighbor[1]
                    
                    if toColor != fromColor {
                        let key = [neighborNode, toColor]
                        guard !visited.contains(key) else {
                            continue
                        }
                        
                        visited.insert(key)
                        newQueue.append(neighbor)
                    }
                }
            }
            
            distance += 1
            queue = newQueue
        }
        
        return distances
    }
}
