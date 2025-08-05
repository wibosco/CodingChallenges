//
//  CloneGraph.swift
//  LeetCode
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/clone-graph/
struct CloneGraph {
    
    //Time: O(n + e) where n is the number of vertice
    //               where e is the number of edges
    //Space: O(n) where n is the number stored in the `vertices` and `visited`
    //graph theory
    //BFS
    //dictionary
    //
    //Solution Description:
    //Traverse the graph using BFS to make a copy all of the vertices, storing those copies in the `copiedVertices`
    //dictionary. During this traversal we also associate all copied vertices with their neighbors.
    func cloneGraph(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }
        
        var copies = [GraphVertice: GraphVertice]()
        copies[vertice] = GraphVertice(vertice.val)
        
        var queue = [vertice]
        
        while !queue.isEmpty {
            var newQueueItems = [GraphVertice]()
            
            for v in queue {
                let copy = copies[v]
                
                for neighbor in v.neighbors {
                    if let copiedNeighbor = copies[neighbor] {
                        copy?.neighbors.append(copiedNeighbor)
                    } else {
                        let copiedNeighbor = GraphVertice(neighbor.val)
                        copies[neighbor] = copiedNeighbor
                        copy?.neighbors.append(copiedNeighbor)
                        
                        newQueueItems.append(neighbor)
                    }
                }
                
                queue = newQueueItems
            }
        }
        
        return copies[vertice]
    }
    
    //Time: O(n + e) where n is the number of vertice
    //               where e is the number of edges
    //Space: O(n) where n is the number stored in the `vertices` and `visited`
    //graph theory
    //BFS
    //dictionary
    //two pass
    //visited
    //
    //Solution Description:
    //Traverse the graph using BFS to make an initial copy all of the vertices and store those copies in the `copiedVertices`
    //dictionary - this pass doesn't include connecting vertices together. A second pass is then made that associates the
    //vertices with their neighbors.
    func cloneGraph2(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }
        
        var copies = [GraphVertice: GraphVertice]()
        copies[vertice] = GraphVertice(vertice.val)
        
        var queue = [vertice]
        var visited = Set<GraphVertice>()
        visited.insert(vertice)
        
        while !queue.isEmpty {
            var newQueueItems = [GraphVertice]()
            
            for v in queue {
                for neighbor in v.neighbors {
                    guard !visited.contains(neighbor) else {
                        continue
                    }

                    copies[neighbor] = GraphVertice(neighbor.val)
                    
                    newQueueItems.append(neighbor)
                    visited.insert(neighbor)
                }
            }
            
            queue = newQueueItems
        }
        
        for v in copies.keys {
            for neighbor in v.neighbors {
                let copy = copies[v]
                copy?.neighbors.append(copies[neighbor]!)
            }
        }
        
        return copies[vertice]
    }
    
    //Time: O(n + e) where n is the number of vertices
    //               where e is the number of edges
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //dictionary
    //inout
    //bottom up
    //
    //Solution Description:
    //Perform a recursive DFS search through the graph, making a copy when we encounter an unvisited vertice and using the
    //original vertice to build that copies neighbor list. If we have already copied a vertice that we encounter (i.e. a
    //later vertice that has been previously copied vertice as a neighbor) then we return it straight away.
    func cloneGraph3(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }

        var copies = [GraphVertice: GraphVertice]()
        deepCopy(vertice, &copies)

        return copies[vertice]!
    }

    @discardableResult
    private func deepCopy(_ curr: GraphVertice, _ copies: inout [GraphVertice: GraphVertice]) -> GraphVertice {
        guard copies[curr] == nil else {
            return copies[curr]!
        }

        let copy = GraphVertice(curr.val)
        copies[curr] = copy

        for neighbor in curr.neighbors {
            let neighborCopy = deepCopy(neighbor, &copies)
            copy.neighbors.append(neighborCopy)
        }

        return copy
    }
    
    //Time: O(n + e) where n is the number of vertice
    //               where e is the number of edges
    //Space: O(n) where n is the number stored in the `vertices` and `visited`
    //graph theory
    //DFS
    //recursive
    //dictionary
    //two pass
    //visited
    //
    //Solution Description:
    //Traverse the graph using DFS to make an initial copy all of the vertices and store those copies in the `copiedVertices`
    //dictionary - this pass doesn't include connecting vertices together. A second pass is then made that associates the
    //vertices with their neighbors.
    func cloneGraph4(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }
        
        var copies = [GraphVertice: GraphVertice]()
        var visited = Set<GraphVertice>()
        deepCopy(vertice, &copies, &visited)
        connectNeighbors(copies)
        
        return copies[vertice]! //return copy of vertice passed in
    }
    
    private func deepCopy(_ curr: GraphVertice, _ copies: inout [GraphVertice: GraphVertice], _ visited: inout Set<GraphVertice>) {
        guard !visited.contains(curr) else {
            return
        }
    
        visited.insert(curr)
        
        let copy = GraphVertice(curr.val)
        copies[curr] = copy
        
        for neighbor in curr.neighbors {
            deepCopy(neighbor, &copies, &visited)
        }
    }
    
    private func connectNeighbors(_ copies: [GraphVertice: GraphVertice]) {
        for (original, copy) in copies {
            for originalNeighbor in original.neighbors {
                let copiedNeighbor = copies[originalNeighbor]!
                copy.neighbors.append(copiedNeighbor)
            }
        }
    }
}
