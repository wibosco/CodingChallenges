//
//  NetworkDelayTime.swift
//  LeetCode
//
//  Created by William Boles on 03/07/2023.
//

import Foundation

//https://leetcode.com/problems/network-delay-time/
struct NetworkDelayTime {
    
    //Time: O((n + e) * (n log n)) where n is the number of vertices in the graph
    //                             where e is the number of edges
    //Space: O(n)
    //graph theory
    //greedy
    //Dijkstra
    //visited
    //directed graph
    //weighted graph
    //adjacency list
    //sorting
    //shortest path
    //
    //Solution Description:
    //Using Dijkstra's algorithm we calculate the cheapest/shortest path from `k` to all connected nodes. Dijkstra algorithm is
    //greedy in nature - it always chooses the smallest/cheapest path to traverse. In order to build the graph we first convert
    //the edges (`times`) to an adjacency list. Then starting at `k` we add all neighbors to a priority queue and calculate the
    //distance it would take to travel between between these nodes (taking into account any distance already travelled). We
    //store this distance in the `distances` dictionary with the node to be travelled to (`neighbor`) as the key and the
    //distance as the value - it's important to note again, that the distance is the total distance to travel to that node not
    //just the immediate distance between the two nodes (`node` and `neighbor`). If that `neighbor` node has already been
    //reached via a different path then we check if the current path is smaller/cheaper than the existing path and only if it
    //is do we update `distances` with the current paths distances (all paths start out as infinite distance i.e `distances`
    //does not contain the key) - a process known as relaxation. If neighbor hasn't already been visited we add it to
    //`priorityQueue`. Once all neighbors have been checked we re-sort the queue so that the smallest/cheapest next node to
    //travel to is at the end. After traversing the graph, we iterate through each node in the graph and add the time taken
    //to get to that node to `totalTime` - if we encounter `Int.max` as a value then we treat that as there being no path
    //between `k` and that node and so immediately return `-1`. Once we have summed all times, we return `totalTime`.
    //
    //N.B. I've omitted using a MinHeap as this isn't a data structure included with standard Swift and won't be fessible to
    //code it in a coding challenge.
    static func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adjList = Array(repeating: [(Int, Int)](), count: n)
        for edge in times {
            let src = edge[0] - 1 //nodes in times are label from 1 rather than 0 so we adjust
            let dst = edge[1] - 1
            let time = edge[2]

            adjList[src].append((dst, time))
        }
        
        let adjustedK = k - 1
        //remember `distances` will contain the accumulative smallest path from `k` to the other graph nodes
        let distances = buildShortestPath(from: adjustedK, adjList, n)
        
        var totalTime = 0
        for i in 0..<n {//get the "smallest" path from `k` to the other graph nodes
            if distances[i] == Int.max { //`i` was never visited
                return -1
            }
            //by taking the max, we allow simultaneous communications to happen without that communication adding
            //to the overall time
            totalTime = max(totalTime, distances[i])
        }
        
        return totalTime
    }
    
    private static func buildShortestPath(from k: Int, _ adjList: [[(Int, Int)]], _ n: Int) -> [Int] {
        //build using Dijkstra algorithm
        var distances = Array(repeating: Int.max, count: n)
        distances[k] = 0 //0 as we start at k so no need to travel there
        
        var visited = Set<Int>()
        var priorityQueue = [k]
        
        while !priorityQueue.isEmpty {
            let node = priorityQueue.removeLast()
            
            visited.insert(node)
            
            for (neighbor, distanceFromNodeToNeighbor) in adjList[node] {
                //note, this is from the source to neighbor
                let distanceFromSourceToNeighbor = (distances[node] + distanceFromNodeToNeighbor)
                
                //we are only interested in the smallest path so any longer paths to `neighbor` are discarded
                guard distanceFromSourceToNeighbor < distances[neighbor] else {
                    continue
                }
                
                //relax
                distances[neighbor] = distanceFromSourceToNeighbor
                
                guard !visited.contains(neighbor) else {
                    continue
                }
                
                priorityQueue.append(neighbor)
            }
            
            //descending order so smallest is last and removal becomes O(1)
            //remember that `distances` contains the total distance from source to that node - not just the branch
            //immediately to that node
            priorityQueue.sort { distances[$0] > distances[$1] }
        }
        
        return distances
    }
    
    //Time: O((n + e) * (n log n)) where n is the number of vertices in the graph
    //                             where e is the number of edges
    //Space: O(n)
    //graph theory
    //greedy
    //Dijkstra
    //visited
    //directed graph
    //weighted graph
    //adjacency list
    //sorting
    //shortest path
    //disconnected graph
    //forest
    //
    //Solution Description:
    //Using Dijkstra's algorithm we calculate the cheapest/shortest path from `k` to all connected nodes. Dijkstra algorithm is
    //greedy in nature - it always chooses the smallest/cheapest path to traverse. In order to build the graph we first convert
    //the edges (`times`) to an adjacency list. Then starting at `k` we add all neighbors to a priority queue and calculate the
    //distance it would take to travel between between these nodes (taking into account any distance already travelled). We
    //store this distance priority queue - it's important to note again, that the distance is the total distance to travel
    //to that node not just the immediate distance between the two nodes (`node` and `neighbor`). If that `neighbor` node has
    //already been reached via a different path but hasn't yet been searched from we add that alernative path to
    //`priorityQueue`. Once all neighbors have been checked we re-sort the queue so that the smallest/cheapest next node to
    //travel to is at the end. As we traverse the graph, we build up the `totalTime` to determine how long it takes to
    //communicate with all connected nodes from `k`. When all connected nodes have been visited we compare the count of
    //`visited` and `n` - if they match then we know all nodes are reachable from `k` and can return `totalTime`, else we know
    //that we have a disconnected graph and can retun `-1`.
    //
    //N.B. I've omitted using a MinHeap as this isn't a data structure included with standard Swift and won't be fessible to
    //code it in a coding challenge.
    static func networkDelayTimeOptimised(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adjList = Array(repeating: [(Int, Int)](), count: n)
        for edge in times {
            let src = edge[0] - 1 //nodes in times are label from 1 rather than 0 so we adjust
            let dst = edge[1] - 1
            let time = edge[2]

            adjList[src].append((dst, time))
        }

        //traversal using an adjusted version of Dijkstra algo
        var totalTime = 0
        let adjustedK = k - 1
        var visited = Set<Int>()
        //queue directly holds the weight of that path to its node rather than storing that weight
        //in a different data structure. This allows for order functionality to be kept "in-house".
        var priorityQueue = [(adjustedK, 0)] //0 as we start at k so no need to travel there
        
        while !priorityQueue.isEmpty {
            let (srcNode, timeFromKToSrc) = priorityQueue.removeLast()
            
            guard !visited.contains(srcNode) else {
                continue
            }
            
            visited.insert(srcNode)
            
            //by taking the max, we allow simultaneous communications to happen without that communication adding
            //to the overall time
            totalTime = max(totalTime, timeFromKToSrc)
            
            for (neighborNode, timeFromSrcToNeighbor) in adjList[srcNode] {
                guard !visited.contains(neighborNode) else {
                    continue
                }
                
                //Get the total weight
                let timeFromKToNeighbor = (timeFromKToSrc + timeFromSrcToNeighbor)
                priorityQueue.append((neighborNode, timeFromKToNeighbor))
            }
            
            //descending order so smallest is last and removal becomes O(1)
            priorityQueue.sort { $0.1 > $1.1 }
        }
        
        return visited.count == n ? totalTime : -1
    }
}
