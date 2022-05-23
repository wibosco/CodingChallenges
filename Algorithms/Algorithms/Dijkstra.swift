//
//  Dijkstra.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

struct Dijkstra {
    
    //Time: O((n + e) * (n log n)) where n is the number of vertices in the graph, e is the number of edges
    //Space: O(n)
    //graph theory
    //greedy
    //Dijkstra
    //visited
    //dictionary
    //directed graph
    //adjacency list
    //sorting
    //
    //Solution Description:
    //Dijkstra algorithm is an algorithm for finding the shortest path between vertices in a weighted graph. Dijkstra algorithm is
    //greedy in nature - it always chooses the smallest/cheapest path to traverse. Starting at `source` we add all neighbors to a
    //priority queue and calculate the distance it would take to travel between between these nodes (taking into account any
    //distance already travelled). We store this distance in the `distances` dictionary with the node to be travelled to
    //(`neighbor`) as the key and the distance as the value - it's important to note again, that the distance is the total distance
    //to travel to that node not just the immediate distance between the two nodes (`node` and `neighbor`). If that `neighbor` node
    //has already been reached via a different path then we check if the current path is smaller/cheaper than the existing path and
    //only if it is do we update `distances` with the current paths distances (all paths start out as infinite distance i.e
    //`distances` does not contain the key) - a process known as relaxation. If neighbor hasn't already been visited we add it to
    //`priorityQueue`. Once all neighbors have been checked we resort the queue so that the smallest/cheapest next node to travel to
    //is at the end. After traversing the graph if any path(s) exists between `source` and `destination` we return the cost/distance
    //of the cheapest/smallest path between them else we return nil
    //
    //N.B. if `source` changes we need to recalculate all paths
    static func shortestDistance(_ adjList: [[(Int, Int)]], _ source: Int, _ destination: Int) -> Int? {
        //treat an unknown key as infinite distance
        var distances = [Int: Int]() //[node: distance]
        distances[source] = 0
        
        var visited = Set<Int>()
        var priorityQueue = [source]
        
        while !priorityQueue.isEmpty {
            let node = priorityQueue.removeLast()
            
            visited.insert(node)
            
            for (neighbor, distanceFromNodeToNeighbor) in adjList[node] {
                //note, this is from the source to neighbor
                let distanceFromSourceToNeighbor = (distances[node]! + distanceFromNodeToNeighbor)
                
                //we are only interested in the smallest path so any longer paths to `neighbor` are discarded
                guard distanceFromSourceToNeighbor < distances[neighbor] ?? Int.max else {
                    continue
                }
                distances[neighbor] = distanceFromSourceToNeighbor
                
                guard !visited.contains(neighbor) else {
                    continue
                }
                
                priorityQueue.append(neighbor)
            }
            
            //descending order so smallest is last and removal becomes O(1)
            //remember that `distances` contains the total distance from source to that node - not just the branch immediately
            //to that node
            priorityQueue.sort { distances[$0]! > distances[$1]! }
        }
        
        //`destination` not existing in `distances` means that `destination` is unreachable from `source`
        return distances[destination]
    }
}
