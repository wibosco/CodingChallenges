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
        
        var copiedVertices = [GraphVertice: GraphVertice]()
        copiedVertices[vertice] = GraphVertice(vertice.val)
        
        var queue = [vertice]
        
        while !queue.isEmpty {
            var newQueueItems = [GraphVertice]()
            
            for v in queue {
                let copy = copiedVertices[v]
                
                for neighbor in v.neighbors {
                    if let copiedNeighbor = copiedVertices[neighbor] {
                        copy?.neighbors.append(copiedNeighbor)
                    } else {
                        let copiedNeighbor = GraphVertice(neighbor.val)
                        copiedVertices[neighbor] = copiedNeighbor
                        copy?.neighbors.append(copiedNeighbor)
                        
                        newQueueItems.append(neighbor)
                    }
                }
                
                queue = newQueueItems
            }
        }
        
        return copiedVertices[vertice]
    }
    
    //Time: O(n + e) where n is the number of vertice
    //               where e is the number of edges
    //Space: O(n) where n is the number stored in the `vertices` and `visited`
    //graph theory
    //BFS
    //dictionary
    //
    //Solution Description:
    //Traverse the graph using BFS to make an initial copy all of the vertices and store those copies in the `copiedVertices`
    //dictionary - this pass doesn't include connecting vertices together. A second pass is then made that associates the
    //vertices with their neighbors.
    func cloneGraphBFS(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }
        
        var copiedVertices = [GraphVertice: GraphVertice]()
        copiedVertices[vertice] = GraphVertice(vertice.val)
        
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

                    copiedVertices[neighbor] = GraphVertice(neighbor.val)
                    
                    newQueueItems.append(neighbor)
                    visited.insert(neighbor)
                }
            }
            
            queue = newQueueItems
        }
        
        for v in copiedVertices.keys {
            for neighbor in v.neighbors {
                let copy = copiedVertices[v]
                copy?.neighbors.append(copiedVertices[neighbor]!)
            }
        }
        
        return copiedVertices[vertice]
    }
    
    //Time: O(n + e) where n is the number of vertices
    //               where e is the number of edges
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //
    //Solution Description:
    //Perform a recursive DFS search through the graph, making a copy when we encounter an unvisited vertice and using the
    //original vertice to build that copies neighbor list. If we have already copied a vertice that we encounter (i.e. a
    //later vertice that has been previously copied vertice as a neighbor) then we return it straight away.
    func cloneGraphDFS(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }

        var copiedVertices = [GraphVertice: GraphVertice]()
        deepCopy(curr: vertice, vertices: &copiedVertices)

        return copiedVertices[vertice]!
    }

    @discardableResult
    private func deepCopy(curr: GraphVertice, vertices: inout [GraphVertice: GraphVertice]) -> GraphVertice {
        guard vertices[curr] == nil else {
            return vertices[curr]!
        }

        let copy = GraphVertice(curr.val)
        vertices[curr] = copy

        for neighbor in curr.neighbors {
            copy.neighbors.append(deepCopy(curr: neighbor, vertices: &vertices))
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
    //
    //Solution Description:
    //Traverse the graph using DFS to make an initial copy all of the vertices and store those copies in the `copiedVertices`
    //dictionary - this pass doesn't include connecting vertices together. A second pass is then made that associates the
    //vertices with their neighbors.
    func cloneGraphMultiplePasses(_ node: GraphVertice?) -> GraphVertice? {
        guard let vertice = node else {
            return nil
        }
        
        var vertices = [GraphVertice: GraphVertice]()
        var visited = Set<GraphVertice>()
        deepCopy(curr: vertice, vertices: &vertices, visited: &visited)
        connectNeighbors(vertices: vertices)
        
        return vertices[vertice]! //return copy of vertice passed in
    }
    
    private func deepCopy(curr: GraphVertice, vertices: inout [GraphVertice: GraphVertice], visited: inout Set<GraphVertice>) {
        guard !visited.contains(curr) else {
            return
        }
    
        visited.insert(curr)
        
        let copy = GraphVertice(curr.val)
        vertices[curr] = copy
        
        for neighbor in curr.neighbors {
            deepCopy(curr: neighbor, vertices: &vertices, visited: &visited)
        }
    }
    
    private func connectNeighbors(vertices: [GraphVertice: GraphVertice]) {
        for (original, copy) in vertices {
            for originalNeighbor in original.neighbors {
                let copiedNeighbor = vertices[originalNeighbor]!
                copy.neighbors.append(copiedNeighbor)
            }
        }
    }
}
