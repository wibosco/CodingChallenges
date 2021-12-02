//
//  GraphNode.swift
//  CodingChallenges
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class GraphNode {
    let val: Int
    
    var neighbors = [GraphNode]()
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension GraphNode {
    static func createUndirectedGraph(fromAdjList edges: [[Int]]) -> GraphNode? {
        guard !edges.isEmpty else {
            return nil
        }
        
        var nodes = [GraphNode]()
        for i in 1...edges.count { //1-indexed
            let node = GraphNode(i)
            nodes.append(node)
        }
        
        for i in 0..<edges.count {
            let fromNode = nodes[i]
            for edge in edges[i] {
                let toNode = nodes[(edge - 1)]
                fromNode.neighbors.append(toNode)
            }
        }
        
        return nodes[0]
    }
    
    static func extractValuesIntoAdjList(fromGraph node: GraphNode?) -> [[Int]] {
        guard let node = node else {
            return []
        }
        
        var queue = [node]
        var visited = [GraphNode]()
        
        while !queue.isEmpty {
            let n = queue.removeFirst()
            
            guard !visited.contains(n) else {
                continue
            }
            
            visited.append(n)
            
            for neighbour in n.neighbors {
                queue.append(neighbour)
            }
        }
        
        let orderedNodes = visited.sorted { $0.val < $1.val }
        
        var adjList = [[Int]]()
        for n in orderedNodes {
            adjList.append(n.neighbors.map { $0.val }.sorted { $0 < $1 } )
        }
        
        return adjList
    }
}

extension GraphNode: Equatable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension GraphNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
